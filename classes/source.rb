require 'json'
require_relative './associate'
class Source
  attr_accessor :name

  include Associate

  def initialize(name:, id: rand(1000))
    @id = id
    @name = name
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
    item = Source.new(name: json['name'], id: json['id'])
    item.add_all_items json['items']
    item
  end

  def add_item(item)
    @items << item
    item.add_genre self
  end
end
