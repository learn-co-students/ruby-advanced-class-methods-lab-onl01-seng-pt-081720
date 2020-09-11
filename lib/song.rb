class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end 
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    sorted = self.all.sort_by { |song| song.name }
    sorted
  end 
  
  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    song_artist = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.new
    song.artist_name = song_artist
    song.name = song_name
    song
  end 
  
  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    song_artist = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.artist_name = song_artist
    song.name = song_name
    song
  end 
  
  def self.destroy_all
    self.all.clear
  end

end
