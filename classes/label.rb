require 'json'
class Label
  attr_accessor :title, :color

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
        id: @id
      }
    )
  end

  def self.from_json(json)
    Source.new(json['title'], json['color'], json['id'])
  end

  def add_item(item)
    @items << item
    item.add_label self
  end
end
