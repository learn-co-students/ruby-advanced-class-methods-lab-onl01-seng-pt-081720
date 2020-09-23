require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all= []

  def self.all #returns contents of the array
    @@all
  end

  def save 
    self.class.all << self #???
  end

  def self.create
    song = self.new #initializes a new song instance
    @@all << song #pushes new instance into array
    song #returns the instance of the song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name #
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name #sets the string taken in as the new song's name
    @@all << song #pushes the new named instance into array
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song| #finds first match of song name in @@all array
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil #if the song name is not in the array
      self.create_by_name(song_name) #create a new song 
    else
      self.find_by_name(song_name) # if the song name is in the array, return that song
    end
  end

  def self.alphabetical
    @@all.sort_by {|song_name| song_name.name} 
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end 
end