require_relative '../classes/music_album'
require 'date'

describe MusicAlbum do
  context 'It should create a musicAlbum instance with onspotify, name and published date' do
    music = MusicAlbum.new(on_spotify: false, name: 'hello', publish_date: DateTime.parse('2012-05-01'))
    it 'creates new musicAlbum with the given parameters' do
      expect(music).to be_an_instance_of MusicAlbum
    end
    it 'should check if it can be archived' do
      music.move_to_archive
      is_archived = music.archived
      expect(is_archived).to eq false
    end
    it 'Should check the musicAlbum name' do
      expect(music.name).to eq 'hello'
    end
  end
end
