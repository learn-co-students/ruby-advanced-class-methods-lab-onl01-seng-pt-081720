require 'pry'

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
    song = Song.new()
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new()
    song.name = name
    song
  end

  def self.create_by_name(new_name)
    song = Song.new()
    song.name = new_name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|i| i.name == name }
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    if new_song == nil
      new_song = self.create_by_name(name)
    end
    new_song
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(name)
    array_values = name.split(" - ")
    new_song = Song.new()
    new_song.name = array_values[1].sub(".mp3", "")
    new_song.artist_name = array_values[0]
    new_song
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end

  def self.destroy_all
    @@all.clear
  end
end
