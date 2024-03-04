class BinarySearch
  INDEX_NOT_FOUND = -1
  attr_accessor :array, :number

  def initialize(array, number)
    @array = array
    @number = number
  end

  def search
    left = 0 # this is going to be an argument in the recursive version
    right = array.length - 1 # this is also going to be an argument in the recursive version

    while left <= right # this is going to be the basic case on the recursive version
      midst_index = (left + right) / 2
      return midst_index if number.eql?(array[midst_index])

      if number < array[midst_index]
        right  = midst_index - 1
      else
        left = midst_index + 1
      end
    end

    INDEX_NOT_FOUND # this is going to be the result from the guard clause in the recursive version
  end

  def recursive_search(left=0, right=((array.length) - 1))
    return INDEX_NOT_FOUND if left > right # the basic case is the loop terminator condition from the interactive one.
    # returning the guard clause above is the final result from the iteractive version

    midst_index = (left + right) / 2
    return midst_index if number.eql?(array[midst_index])

    if number < array[midst_index]
      recursive_search(left, midst_index - 1)
    else
      recursive_search(midst_index + 1, right)
    end
  end
end