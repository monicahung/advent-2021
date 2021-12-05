def day3
  data = File.open('input_day_3.rb').readlines.map { |num|
    num.chomp.split('').map(&:to_i)
  }
  # data looks like [[0, 0, 1, 0, 0], [0, 1, 1, 1, 0]]
  # init
  counts = []
  (0..data[0].length-1).each do
    counts.push({ 'ones' => 0, 'zeroes' => 0 })
  end

  # count all the occurrences
  data.each_with_index do |val, index|
    (0..data[0].length).each do |bit|
      case data[index][bit]
      when 0
        counts[bit]['zeroes'] += 1
      when 1
        counts[bit]['ones'] += 1
      end
    end
  end

  # generate epsilon and gamma
  most_common = []
  least_common = []
  counts.each do |counts|
    if counts['ones'] > counts['zeroes']
      most_common.push('1')
      least_common.push('0')
    else
      # assumes never the same amount
      most_common.push('0')
      least_common.push('1')
    end
  end

  # convert to decimal
  num_common = most_common.join.to_i(2)
  num_uncommon = least_common.join.to_i(2)

  # answer
  puts num_common * num_uncommon
end
