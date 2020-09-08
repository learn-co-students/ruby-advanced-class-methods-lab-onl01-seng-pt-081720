require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save #instance method
    self.class.all << self
  end

  def self.create
    new_song = self.new #instantiated a song (created a new one)
    new_song.save       #called the instance method 'save' on the instance new_song
    new_song            #returned the instance
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name} #sort_by takes in 1 argument, and you have to call a method that will be used to map over the collection
  end

  def self.new_from_filename(filename) #filename example: Taylor Swift - Blank Space.mp3
    song = self.new
    song.artist_name = filename.split(" - ")[0] #retrieve artist_name by making the filename string into an array and getting 1st item in array
    song.name = filename.split(" - ")[1].chomp(".mp3") #retrive song name by making filename string into an array and getting 2nd item in array
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
