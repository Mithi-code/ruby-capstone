require 'json'
class Source
  attr_accessor :name

  def initialize(name:, id: rand(1000))
    @id = id
    @name = name
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
