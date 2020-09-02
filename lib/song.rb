require "pry"

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
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    @@all[-1]
  end

  def self.find_by_name(name)
    @@all.find{|p| p.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |a| a.name}
  end

  def self.new_from_filename(name)
    file_split = name.split(" - ")
    file_art = file_split[0]
    file_name = file_split[1]
    name_ext = file_name.split(".")
    file_name = name_ext[0]
    song = self.new
    song.name = file_name
    song.artist_name = file_art
    song
  end

  def self.create_from_filename(name)
    file_split = name.split(" - ")
    file_art = file_split[0]
    file_name = file_split[1]
    name_ext = file_name.split(".")
    file_name = name_ext[0]
    song = self.new
    song.name = file_name
    song.artist_name = file_art
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
