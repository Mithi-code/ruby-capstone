require_relative '../item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher:, cover_state:, publish_date:, id: rand(1000))
    super(id, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    JSON.generate(
      {
        publisher: @publisher,
        cover_state: @cover_state,
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
    book = Book.new(
      cover_state: json['cover_state'],
      publisher: json['publisher'],
      publish_date: DateTime.parse(json['publish_date']),
      id: json['id']
    )
    book.add_author Author.from_json(json['author'])
    book.add_genre Genre.from_json(json['genre'])
    book.add_label Label.from_json(json['label'])
    book.add_source Source.from_json(json['source'])
    book
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
