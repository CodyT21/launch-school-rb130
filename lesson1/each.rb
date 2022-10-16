# recreating the Array#each method
# method will return the calling object

# inputs array, optional block
# outputs - original array
# algorithm
# interate a counter for the indices of the array object
# yield each elment to the block
# return original array

def each(array)
  counter = 0
  while (counter < array.length)
    yield(array[counter])
    counter += 1
  end

  array
end

p each([1, 2, 3]) { |num| puts num }