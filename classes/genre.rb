require_relative '../item'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name:, id: rand(1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre self
  end
end
