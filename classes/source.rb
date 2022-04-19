class Source
  attr_accessor :name

  def initialize(name:, id: rand(1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre self
  end
end
