require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    return song
  end

  def self.all
    @@all
  end

def self.new_by_name(title)
  song = self.new
  song.name = title
  song
end

def self.create_by_name(title)
  song = self.create
  song.name = title
  song
end

def self.find_by_name(title)
  self.all.find{|song| song.name == title}
end

def self.find_or_create_by_name(title)
  song = self.find_by_name(title)
  if song
    song
  else
    self.create_by_name(title)
  end
end

def self.alphabetical
  self.all.sort_by{|song| song.name}
end

def self.new_from_filename(file)
  a = file.split(" - ")
  artist_name = a[0]
  song_name = a[1].gsub(".mp3","")

  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(file)
  a = file.split(" - ")
  artist_name = a[0]
  song_name = a[1].gsub(".mp3","")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end
  def save
    self.class.all << self
  end

end
