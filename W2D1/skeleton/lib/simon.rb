require 'byebug'
require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    seq.shuffle!.each do |color|
      puts color.colorize(color.to_sym)
      sleep(1)
      system("clear")
      sleep(0.1)
    end
  end

  def require_sequence
    puts "enter sequence(i.e. blue green etc.)"
    req_seq = gets.chomp.split
    seq.each_with_index do |color, idx|
      unless color == req_seq[idx]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Nice. next round"
    sleep(1)
  end

  def game_over_message
    puts "You lost"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end
