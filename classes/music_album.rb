require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date
  attr_reader :items

  def initialize(id: rand(1000), publish_date:, on_spotify:, name:)
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
