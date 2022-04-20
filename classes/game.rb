require_relative '../item'
require 'date'
require 'json'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer:, last_played_at:, publish_date:, id: rand(1000))
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*_args)
    JSON.generate(
      {
        multiplayer: @multiplayer,
        last_played_at: @last_played_at,
        publish_date: @publish_date,
        archived: @archived,
        genre: @genre.shallow_copy,
        source: @source.shallow_copy,
        author: @author.shallow_copy,
        label: @label.shallow_copy
      }
    )
  end

  def self.from_json(json)
    game = Game.new(
      multiplayer: json['multiplayer'],
      last_played_at: DateTime.parse(json['last_played_at']),
      publish_date: DateTime.parse(json['publish_date']),
      id: json['id']
    )
    game.add_author Author.from_json(json['author'])
    game.add_genre Genre.from_json(json['genre'])
    game.add_label Label.from_json(json['label'])
    game.add_source Source.from_json(json['source'])
    game
  end

  private

  def can_be_archived?
    diff = DateTime.now.year - @last_played_at.year
    super && (diff > 2)
  end
end
