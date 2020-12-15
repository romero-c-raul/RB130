array = [1, 2, 3, 4, 5]

def select(arr)
  index = 0
  new_arr = []
  
  until index >= arr.size do
    new_arr << arr[index] if yield(arr[index])
    index += 1
  end
  
  new_arr
end


p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true