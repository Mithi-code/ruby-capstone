require_relative '../item'
require 'json'
require_relative './associate'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  include Associate
  def initialize(name:, id: rand(1000))
    @name = name
    @id = id
    @items = []
  end

  def to_json(*_args)
    JSON.generate(
      {
        name: @name,
        id: @id,
        items: @items
      }
    )
  end

  def self.from_json(json)
    item = Genre.new(name: json['name'], id: json['id'])
    item.add_all_items json['items']
    item
  end

  def add_item(item)
    @items << item
    item.add_genre self
  end
end
