require '../item'

class Genre 
    attr_accessor :name
    attr_reader :id, :items

    def initialize(name)
        @name = name
        @id = rand (1...1000)
        @items = []
    end

    def add_item(item)
        @items << item
        item.add_genre self
    end
end