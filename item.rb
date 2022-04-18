require 'date'

class Item
  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  private

  def can_be_archived?()
    current_year = Time.new.year
    publish_year = publish_date.year
    diff = current_year - publish_year
    diff > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
