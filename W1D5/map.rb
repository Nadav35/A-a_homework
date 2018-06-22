require 'set'

class Map

  def initialize
    map = []
  end

  def set(key, value)
    idx = nil
    map.each_with_index do |el, i|
      idx = i if el[0] == key
    end

    if idx
      map[idx][1] = value
    else
      map.push([key, value])
    end
  end

  def get(key)
    map.each do |el|
      return el[1] if el[0] == key
    end
    nil
  end

  def delete(key)
    map.select! {|el| el[0] != key}
  end

  def show
    arr.flatten
  end


end
