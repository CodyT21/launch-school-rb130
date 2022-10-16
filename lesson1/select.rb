# recreating the Array#select method

# input - array
# output - new array
# algorithm
#   - initialize new blank array
#   - loop through each element in the array
#   - yield loop execution to block
#   - add element to array if block returns true
#   - return new array once through loop of input array elements

def select(array)
  new_arr = []

  counter = 0
  while (counter < array.size)
    ele = array[counter]
    new_arr << ele if yield(ele)
    counter += 1
  end

  new_arr
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true