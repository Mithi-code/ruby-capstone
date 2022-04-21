require_relative('../classes/book')
require 'date'

describe Book do
  it 'a book should be archived if cover_state is bad' do
    book = Book.new(cover_state: 'bad', publisher: false, publish_date: DateTime.parse('2010-01-01'))
    book.move_to_archive

    expect(book.archived).to be true
  end

  it 'a book should be archived if it as was published more than 10 years ago' do
    book = Book.new(cover_state: 'bad', publisher: false, publish_date: DateTime.parse('2015-01-01'))
    book.move_to_archive

    expect(book.archived).to be true
  end
end
