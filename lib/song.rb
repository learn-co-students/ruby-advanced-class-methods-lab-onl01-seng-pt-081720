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
  new_song = self.new 
  @@all << new_song
  new_song
end 
def self.new_by_name (song_name)
  new_song = self.new 
  new_song.name = song_name
 new_song 
end 
def self.create_by_name (song_name)
  new_song = self.new 
  new_song.name = song_name
  @@all << new_song 
  new_song
end 
def self.find_by_name (song_name)
  @@all.find{|song| song.name == song_name}
end 

def self.find_or_create_by_name (song_name)
  self.find_by_name(song_name) ||
  self.create_by_name(song_name) 
end 

def self.new_from_filename (filename)
  split_filename = filename.chop.chop.chop.chop.split(" - ")
   song = Song.new 
  song.name = split_filename[1]
  song.artist_name = split_filename[0]
  song 
end

def self.create_from_filename (filename)
   split_filename = filename.chop.chop.chop.chop.split(" - ")
   song = Song.new 
  song.name = split_filename[1]
  song.artist_name = split_filename[0]
  song.save 
end 

def self.alphabetical 
  @@all.sort_by! { |song| song.name} 
end 

def self.destroy_all
  @@all = []
end 
end 
