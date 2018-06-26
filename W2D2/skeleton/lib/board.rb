require 'byebug'

class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    13.times.each do |i|
      if (0..5).include?(i) || (7..12).include?(i)
        (0..3).each do |j|
          cups[i] << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..13).include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_array = cups[start_pos]
    @cups[start_pos] = []
    # byebug if start_pos == 12
    current_cup_index = start_pos
    until stones_array.empty?
      current_cup_index += 1
      current_cup_index %= cups.length
      if current_cup_index == 6
        cups[6] << stones_array.pop if current_player_name == name1
      elsif current_cup_index == 13
        cups[13] << stones_array.pop if current_player_name == name2
      else
        cups[current_cup_index] << stones_array.pop
      end
    end
    render
    next_turn(current_cup_index)

  end

  def next_turn(ending_cup_idx)
    case
    when ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    when cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx

    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if cups[6].length == cups[13].length
      return :draw
    else
      if cups[6].length > cups[13].length
        return name1
      else
        return name2
      end
    end
  end
end
