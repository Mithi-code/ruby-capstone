class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name, id = rand(1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end