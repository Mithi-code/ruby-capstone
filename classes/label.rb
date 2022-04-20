require 'json'
require_relative './associate'
class Label
  attr_accessor :title, :color

  include Associate
  def initialize(title:, color:, id: rand(1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def to_json(*_args)
    JSON.generate(
      {
        title: @title,
        color: @color,
        id: @id,
        items: @items
      }
    )
  end

  def self.from_json(json)
    item = Label.new(title: json['title'], color: json['color'], id: json['id'])
    item.add_all_items json['items']
    item
  end

  def add_item(item)
    @items << item
    item.add_label self
  end
end
