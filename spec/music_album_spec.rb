require_relative '../classes/music_album'

describe MusicAlbum do
  context 'It should create a musicAlbum instance with onspotify, name and published date' do
    music = MusicAlbum.new(publish_date: '2012-05-01', name: true, on_spotify: 'Hello')
    it 'creates new musicAlbum with the given parameters' do
      expect(music).to be_an_instance_of MusicAlbum
    end
    it 'should check if it can be archived' do
      expect(music.on_spotify).to eq 'Hello'
    end
    it 'Should check the musicAlbum name' do
      expect(music.name).to eq true
    end
  end
end
