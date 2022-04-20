require_relative('../classes/movie')
require 'date'

describe Movie do
  it 'a movie should be archived if it as was published more than 10 years ago' do
    movie = Movie.new(silent:false, published_date:DateTime.parse("2000-01-01"))
    movie.move_to_archive

    expect(movie.archived).to be true
  end

  it 'a movie should be archived if it silent' do
    movie = Movie.new(silent:true, published_date:DateTime.parse("2020-01-01"))
    movie.move_to_archive

    expect(movie.archived).to be true
  end

  it 'a movie shouldn\'t be archived if it as was published less than 10 years ago and not silent' do
    movie = Movie.new(silent:false, published_date:DateTime.parse("2020-01-01"))
    movie.move_to_archive

    expect(movie.archived).to be false
  end
end