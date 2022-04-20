module Associate
  def add_all_items(list)
    list.each { |item| add_item(item) }
  end

  def clear_items
    @items.clear
  end

  def shallow_copy
    copy = clone
    copy.clear_items
    clone
  end
end
