require 'date'
require 'json'

class Item
  attr_accessor :genre, :source, :author, :label
  attr_reader :archived, :id, :publish_date

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_source(source)
    @source = source
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def self.from_json(json)
    Item.new(json['id'], json['publish_date'], archived: json['archived'])
  end

  private

  def can_be_archived?()
    current_year = Time.new.year
    publish_year = @publish_date.year
    diff = current_year - publish_year
    diff > 10
  end
end
