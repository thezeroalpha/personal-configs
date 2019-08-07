#!/usr/bin/env ruby
# vim: foldmethod=indent foldlevel=0
module Colorizer
  BASIC16 = [
    [ 0x00, 0x00, 0x00 ],
    [ 0xCD, 0x00, 0x00 ],
    [ 0x00, 0xCD, 0x00 ],
    [ 0xCD, 0xCD, 0x00 ],
    [ 0x00, 0x00, 0xEE ],
    [ 0xCD, 0x00, 0xCD ],
    [ 0x00, 0xCD, 0xCD ],
    [ 0xE5, 0xE5, 0xE5 ],
    [ 0x7F, 0x7F, 0x7F ],
    [ 0xFF, 0x00, 0x00 ],
    [ 0x00, 0xFF, 0x00 ],
    [ 0xFF, 0xFF, 0x00 ],
    [ 0x5C, 0x5C, 0xFF ],
    [ 0xFF, 0x00, 0xFF ],
    [ 0x00, 0xFF, 0xFF ],
    [ 0xFF, 0xFF, 0xFF ]
  ]

  # Some functions that need to be defined
  def xterm2rgb16(color)
    # 16 basic colors
    r, g, b = 0, 0, 0
    r, g, b = BASIC16[color]
    return [r, g, b]
  end
  def xterm2rgb256(color)
    # 16 basic colors
    r, g, b = 0, 0, 0
    if color < 16
      return xterm2rgb16(color)

      # color cube color
    elsif color >= 16 && color < 232
      color=color-16
      valuerange6 = [ 0x00, 0x5F, 0x87, 0xAF, 0xD7, 0xFF ]
      r = valuerange6[(color/36)%6]
      g = valuerange6[(color/6)%6]
      b = valuerange6[color%6]

      # gray tone
    elsif color >= 232 && color <= 255
      r = 8 + (color-232) * 0x0a
      g, b = r, r
    end

    return [r, g, b]
  end
  def check16colorterm(rgblist, minlist)
    min = minlist[0] + minlist[1] + minlist[2]
    [[205,0,0], [0,205,0], [205,205,0], [205,0,205], [0,205,205], [0,0,238], [92,92,255]].each do |value|
      # euclidian distance would be needed,
      # but this works good enough and is faster.
      t = value.each_with_index.map { |v, i| (v - rgblist[i]).abs }.sum
      return value if min > t
    end
    return rgblist
  end
  def roundcolor(arr)
    result = []
    minlist = []
    min    = 1000
    list = [ 0x00, 0x5F, 0x87, 0xAF, 0xD7, 0xFF ]
    arr.each do |item|
      r = nil
      list.each do |val|
        t = (val - item).abs
        if (min > t)
          min = t
          r   = val
        end
      end
      result << r if not r.nil?
      minlist << min
      min = 1000
    end
    # Check with the values from the 16 color xterm, if the difference
    # is lower
    result = check16colorterm(result, minlist)
    return result
  end

  def rgb2term color
    if color == '000000'
      return 0
    elsif color == 'FFFFFF'
      return 15
    else
      r = color[0..1].to_s.to_i(16)
      g = color[2..3].to_s.to_i(16)
      b = color[4..5].to_s.to_i(16)

      # Try exact match first
      colortable = (0..255).map { |x| xterm2rgb256(x) }
      i = colortable.index([r, g, b])
      return i if !i.nil? && i > -1

      # Grey scale ?
      if r == g &&  r == b
        # 0 and 15 have already been take care of
        if r < 5
          return 0 # black
        elsif r > 244
          return 15 # white
        end
        # grey cube starts at index 232
        return 232+(r-5)/10
      end

      # Round to the next step in the xterm color cube
      # euclidian distance would be needed,
      # but this works good enough and is faster.
      round = roundcolor([r, g, b])
      # Return closest match or -1 if not found
      return colortable.index(round)
    end
  end
end

# Where my code starts
# Next step - make it automatically name the file & move it to ~/.vim/colors, based on file passed as arg.
include Colorizer
primary=[]
links={}
background="light"
if ARGV[0].nil?
  abort "Colors file required as argument"
elsif not File.file? ARGV[0]
  abort "File #{ARGV[0]} not found."
elsif not ARGV[0].end_with? ".vimcolor"
  abort "File extension should be .vimcolor"
end

File.open(ARGV[0], "r").each do |line|
  line.strip!
  if line.start_with? "link"
    from, to = line.split(" ")[1..-1]
    from.split(',').each do |from_group|
      links[from_group] = to
    end
  elsif line.empty? || line.start_with?("\"")
    # Ignore
  elsif line.start_with? "background"
    background = line.split.last
  else
    line_arr = line.split
    group = line_arr.first
    rest = line_arr[1..-1].join ' '

    colors, attrs = rest.split('.')
    fg, bg = colors.split(',').map { |x| x.strip }

    bg = "NONE" if bg.nil?

    attrs = (attrs.nil? ? "NONE" : attrs.split(',').map { |x| x.strip }.join(","))
    primary << [group, fg, bg, attrs]
  end
end


File.open("#{ENV['HOME']}/.vim/colors/#{ARGV[0].sub('.vimcolor', '.vim')}", "w") do |f|
  f.puts <<~EOF
  if version > 580
    highlight clear
    if exists("syntax_on")
      syntax reset
    endif
  endif
  let g:colors_name = "#{ARGV[0].sub('.vimcolor', '')}"
  set background=#{background}
  EOF
  primary.each do |item|
    f.puts "hi #{item[0]} guifg=#{item[1]} guibg=#{item[2]} ctermfg=#{item[1] == "NONE" ? "NONE" : rgb2term(item[1][1..-1])} ctermbg=#{item[2] == "NONE" ? "NONE" : rgb2term(item[2][1..-1])} cterm=#{item[3]} gui=#{item[3]}"
  end
  links.each do |from,to|
    f.puts "hi! link #{from} #{to}"
  end
end

puts "Written to ~/.vim/colors/#{ARGV[0].sub('.vimcolor', '.vim')}"
