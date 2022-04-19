require_relative '../item'
require 'data'

class MusicAlbum < Item
    attr_accessor :on_spotify, :name, :publish_date
    attr_reader :items
    def initialize(on_spotify, name, publish_date)
        super(name, publish_date,)
        @id = id
        @on_spotify = on_spotify
        @name = name
        @items = []
    end
    def can_be_archived?
        super && @on_spotify
    end
end