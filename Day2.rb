def day2
  data = File.open('input_day_2.rb').readlines.map { |instr|
    arr = instr.split(' ')
    arr[1] = arr[1].to_i
    arr
  }
  # data looks like [['forward', 5], ['down', 5]]
  # init values
  horiz_pos = 0
  depth = 0
  aim = 0

  data.each do |instr|
    case instr[0]
    when 'forward'
      horiz_pos += instr[1]
      depth += aim * instr[1]
    when 'down'
      aim += instr[1]
    when 'up'
      aim -= instr[1]
    end
  end

  puts horiz_pos
  puts depth
  puts horiz_pos * depth
end
