require_relative '../classes/game'
require 'date'

def create_a_game(last_played_year = 2000, publish_year = 2000)
  Game.new(
    multiplayer: true,
    last_played_at: DateTime.parse("#{last_played_year}-01-01"),
    publish_date: DateTime.parse("#{publish_year}-01-01"),
    id: 1000
  )
end
describe Game do
  it 'should not move game to archive if publish date is not more than 10 years ago' do
    publish_year = DateTime.now.year.to_i - 10
    last_played_year = DateTime.now.year.to_i - 3
    game = create_a_game(last_played_year, publish_year)
    game.move_to_archive
    is_archived = game.archived
    expect(is_archived).to eq false
  end
  describe 'last publish date is more than 10 years ago' do
    before :all do
      @publish_year = DateTime.now.year.to_i - 11
    end
    it 'should move game to archive if it was last played more than 2 years ago' do
      last_played_year = DateTime.now.year.to_i - 3
      game = create_a_game(last_played_year, @publish_year)
      game.move_to_archive
      is_archived = game.archived
      expect(is_archived).to eq true
    end

    it 'should not move game to archive if the game was last played within 2 years ago' do
      last_played_year = DateTime.now.year.to_i - 2
      game = create_a_game(last_played_year, @publish_year)
      game.move_to_archive
      is_archived = game.archived
      expect(is_archived).to eq false
    end
  end
end
