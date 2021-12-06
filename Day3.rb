def day3
  data = File.open('input_day_3.rb').readlines.map { |num|
    num.chomp.split('').map(&:to_i)
  }
  # data looks like [[0, 0, 1, 0, 0], [0, 1, 1, 1, 0]]

  oxygen = get_oxygen_value(data)
  co2 = get_co2_val(data)

  # convert to decimal
  num_oxygen = oxygen.join.to_i(2)
  num_co2 = co2.join.to_i(2)

  # answer
  puts num_oxygen * num_co2
end

def get_oxygen_value(data)
  # init
  counts = {'ones' => 0, 'zeroes' => 0 }
  new_set_zeroes = []
  new_set_ones = []

  # count all the occurrences
  (0..data[0].length).each do |bit|
    data.each_with_index do |val, index|
      case data[index][bit]
      when 0
        counts['zeroes'] += 1
        new_set_zeroes.push(data[index])
      when 1
        counts['ones'] += 1
        new_set_ones.push(data[index])
      end
    end
    if counts['zeroes'] > counts['ones']
      data = new_set_zeroes
    else
      data = new_set_ones # 1 is default for oxygen
    end
    if data.length == 1
      return data[0]
    end
    #reset counts for next iter
    new_set_zeroes = []
    new_set_ones = []
    counts = {'ones' => 0, 'zeroes' => 0 }
  end
  return data[0]
end

def get_co2_val(data)
  # init
  counts = {'ones' => 0, 'zeroes' => 0 }
  new_set_zeroes = []
  new_set_ones = []

  # count all the occurrences
  (0..data[0].length).each do |bit|
    data.each_with_index do |val, index|
      case data[index][bit]
      when 0
        counts['zeroes'] += 1
        new_set_zeroes.push(data[index])
      when 1
        counts['ones'] += 1
        new_set_ones.push(data[index])
      end
    end
    if counts['zeroes'] > counts['ones'] &&
       counts['ones'] != 0
      data = new_set_ones
    else
      data = new_set_zeroes # 1 is default for oxygen
    end
    if data.length == 1
      return data[0]
    end
    #reset counts for next iter
    new_set_zeroes = []
    new_set_ones = []
    counts = {'ones' => 0, 'zeroes' => 0 }
  end
  return data[0]
end