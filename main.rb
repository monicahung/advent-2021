data = File.open('input.rb').readlines.map { |num|
  num.chomp.to_i
}
#data = File.open('test_data.rb').readlines.map(&:chomp)

count = 0
prev = data.shift(3)
data.each do |num|
  window = prev.last(2).push(num)
  if window.sum > prev.sum
    count += 1
  end
  prev = window
end
puts count