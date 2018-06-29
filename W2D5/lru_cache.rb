require 'byebug'

class LRUCache

  def initialize(size)
    @size = size
    @array = []
  end

  def count
    @array.length
  end

  def add(el)
    case
    when @array.include?(el)
      @array.delete(el)
      @array << el
    when count == @size
      @array.shift
      @array << el
    else
      @array << el
    end
  end

  def show
    p @array
  end

end
