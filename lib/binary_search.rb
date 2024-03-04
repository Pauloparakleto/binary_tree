class BinarySearch
  INDEX_NOT_FOUND = -1
  attr_accessor :array, :number

  def initialize(array, number)
    @array = array
    @number = number
  end

  def search
    left = 0
    right = array.length - 1

    while left <= right
      midst_index = (left + right) / 2
      return midst_index if number.eql?(array[midst_index])

      if number < array[midst_index]
        right  = midst_index - 1
      else
        left = midst_index + 1
      end
    end

    INDEX_NOT_FOUND
  end
end