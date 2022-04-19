require_relative '../item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher:, cover_state:, publish_date:, id: rand(1000))
    super(id, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
