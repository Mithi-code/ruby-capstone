require 'json'
class Author
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name:, last_name:, id: rand(1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def to_json(*_args)
    JSON.generate(
      {
        first_name: @first_name,
        last_name: @last_name,
        id: @id
      }
    )
  end

  def self.from_json(json)
    Source.new(json['first_name'], json['last_name'], json['id'])
  end

  def add_item(item)
    @items << item
    item.add_author self
  end
end
