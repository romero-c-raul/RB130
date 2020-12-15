def reduce(arr, accumulator = 0)
  index = 0
  accumulator = arr.first if arr.first.is_a? String
  accumulator = arr.first if arr.first.is_a? Array

  
  until index >= arr.size do
    current_element = arr[index]
    if accumulator.class == String || accumulator.class == Array
      accumulator = yield(accumulator, current_element) unless index == 0
    else
      accumulator = yield(accumulator, current_element)
    end
    index += 1
  end
  
  accumulator
end



array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num }                # => 25

puts reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']