require_relative 'game'
require_relative 'genre'
require_relative 'source'
require_relative 'label'
require_relative 'author'
require_relative 'music_album'
module Associations
  def add_associate(associate, list, item)
    associate.add_item item
    yield associate
    list << associate
  end

  def label
    puts 'Lets add the Label'
    print 'title: '
    title = gets.chomp
    print 'color: '
    color = gets.chomp
    Label.new(title: title, color: color)
  end

  def source
    puts 'Lets add the Source'
    print 'Source name: '
    name = gets.chomp
    Source.new(name: name)
  end

  def genre
    puts 'Lets add the Genre'
    print 'Genre name: '
    name = gets.chomp
    Genre.new(name: name)
  end

  def author
    puts "Let's add the Author"
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    Author.new(first_name: first_name, last_name: last_name)
  end
end
