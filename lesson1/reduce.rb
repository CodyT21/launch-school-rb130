# recreating Enumerable#reduce
# limited to only array inputs

# input - array, optional integer
# output - integer

def reduce(array, default=nil)
  counter = 0
  accum = default

  while (counter < array.size)
    if accum
      accum = yield(accum, array[counter])
    else
      accum = array[0]
    end
    counter += 1
  end
  
  accum
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
