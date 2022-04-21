require_relative '../item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent:, publish_date:, id: rand(1000))
    super(id, publish_date)
    @silent = silent
  end

  def to_json(*_args)
    JSON.generate(
      {
        silent: @silent,
        publish_date: @publish_date,
        archived: @archived,
        genre: @genre.shallow_copy,
        source: @source.shallow_copy,
        author: @author.shallow_copy,
        label: @label.shallow_copy,
        id: @id
      }
    )
  end

  def self.from_json(json)
    movie = Movie.new(
      silent: json['silent'],
      publish_date: DateTime.parse(json['publish_date']),
      id: json['id']
    )
    movie.add_author Author.from_json(json['author'])
    movie.add_genre Genre.from_json(json['genre'])
    movie.add_label Label.from_json(json['label'])
    movie.add_source Source.from_json(json['source'])
    movie
  end

  private

  def can_be_archived?
    super || @silent
  end
end
