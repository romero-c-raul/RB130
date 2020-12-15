def each(array)
  index = 0
  
  until index >= array.size do
    yield(array[index]) # 1st - 1, 2nd - 2, 3rd - 3, 4th - 4, 5th - 5
    index += 1
  end
  
  array
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end


