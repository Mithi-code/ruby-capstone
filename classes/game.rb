require_relative '../item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at
  def initialize(multiplayer:, last_played_at:, published_date:, id:rand(1000))
    super(id, published_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    diff = DateTime.now.year - @last_played_at.year
    super && (diff > 2)
  end
end

game = Game.new(
  multiplayer: true,
  last_played_at: DateTime.parse('2019-12-01'),
  published_date:DateTime.parse('2000-12-01'))
puts game.can_be_archived?
