require_relative '../item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent:, published_date:, id: rand(1000))
    super(id, published_date)
    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent
  end
end
