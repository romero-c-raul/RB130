
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end
  
  number
end


times(5) do |num|
  puts num
end


# def times(integer) # My attempt
#   number = 0
#   until number == integer do
#     yield(number)
#     number += 1
#   end
  
#   integer
# end