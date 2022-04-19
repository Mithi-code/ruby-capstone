class App
  def initialize
    @books = []
    @games = []
    @authors = []
    @music_album = []
    @movies = []
    @genres = []
    @labels = []
    @sources = []
  end

  def list_books; end

  def list_games
    @games.each_with_index { |game, i| puts "#{i + 1}. #{game}" }
  end

  def list_authors
    @authors.each_with_index { |author, i| puts "#{i + 1}. #{author}" }
  end

  def list_music_albums; end

  def list_movies; end

  def list_genres; end

  def list_labels; end

  def list_sources; end

  def add_book; end

  def add_movie; end

  def add_music_album; end

  def add_game
    is_multiplayer = yes_or_no 'Is it a multiplayer game'
    published_date = get_date 'Publish date '
    last_played_at = get_date 'Last_played_date'
    game = Game.new(
      multiplayer: is_multiplayer,
      published_date: published_date,
      last_played_at: last_played_at
    )
    @games << game
  end
end
