class Source
  attr_accessor :name
  attr_reader :items

  def initialize(name:, id: rand(1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source self
  end
end
