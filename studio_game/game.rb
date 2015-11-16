require_relative 'player'

class Game

  def initialize(title)
    @title = title
    @players = []
  end

  attr_reader :title

  def add_player(player)
    @players << player
  end

  def play

  puts "There are #{@players.count} players in #{@title}:"

  @players.each do |player|
    puts player
  end

  @players.each do |player|

    player.blam
    player.w00t
    player.w00t
    player.blam
    puts player

  end

  end

end