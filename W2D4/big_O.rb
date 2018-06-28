require 'byebug'



def sluggish_octopus(fishes)
  longest = fishes[0]
  fishes.each_with_index do |fish, idx|
    (idx + 1...fishes.length).each do |idx2|
      if fishes[idx2].length > longest.length
        longest = fishes[idx2]
      end
    end
  end
  longest
end

def dominant_octopus(fishes)

  return fishes if fishes.length <= 1

  pivot = fishes[0]
  left = fishes[1..-1].select {|fish| pivot.length >= fish.length}
  right = fishes[1..-1].select {|fish| pivot.length < fish.length}

  dominant_octopus(left) + [pivot] + dominant_octopus(right)


end

def clever_octopus(fishes)
  longest = nil
  fishes.each_with_index do |fish, idx|
    if longest.nil? || fish.length > longest.length
      longest = fish
    end
  end
  longest

end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |dir, idx|
    return idx if direction == dir
  end

end



fishes = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
]

tiles_array = ["up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up" ]
