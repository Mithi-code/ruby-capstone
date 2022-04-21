require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date
  attr_reader :items

  def initialize(publish_date:, on_spotify:, name:, id: rand(1000))
    super(id, publish_date)
    @id = id
    @on_spotify = on_spotify
    @name = name
    @items = []
  end

  def to_json(*_args)
    JSON.generate(
      {
        on_spotify: @on_spotify,
        publish_date: @publish_date,
        archived: @archived,
        genre: @genre.shallow_copy,
        source: @source.shallow_copy,
        author: @author.shallow_copy,
        label: @label.shallow_copy,
        id: @id,
        name: @name
      }
    )
  end

  def self.from_json(json)
    music = MusicAlbum.new(
      on_spotify: json['on_spotify'],
      name: json['name'],
      publish_date: DateTime.parse(json['publish_date']),
      id: json['id']
    )
    music.add_author Author.from_json(json['author'])
    music.add_genre Genre.from_json(json['genre'])
    music.add_label Label.from_json(json['label'])
    music.add_source Source.from_json(json['source'])
    music
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
