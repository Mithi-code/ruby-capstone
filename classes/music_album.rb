require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date
  attr_reader :items

  def initialize(publish_date:, on_spotify:, name:, id: rand(1000))
    super(id, publish_date)
    @id = id
    @on_spotify = on_spotify
    @name = name
    @items = []
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
