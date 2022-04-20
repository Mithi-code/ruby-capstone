require_relative '../item'
require 'json'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name:, id: rand(1000))
    @name = name
    @id = id
    @items = []
  end

  def to_json(*_args)
    JSON.generate(
      {
        name: @name,
        id: @id
      }
    )
  end

  def self.from_json(json)
    Source.new(json['name'], json['id'])
  end

  def add_item(item)
    @items << item
    item.add_genre self
  end
end
