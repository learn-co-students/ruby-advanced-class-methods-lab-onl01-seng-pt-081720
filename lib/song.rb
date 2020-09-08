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
    # initializes new Song
    song = Song.new
    # utilizes pre-built saving method
    song.save
    # returns Song instance
    song
  end
  
  def self.new_by_name(song_name)
    # initializes new Song
    song = self.new
    # name accessor (name of Song instance) is now = to passed in name
    song.name = song_name
    # return the song instance
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    # just calls on our existing methods with the || (or) operand
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    # separates the artist name and song name based on format given
    new_file = filename.split(" - ")
    # artist name is now equal to first index of array that was created when split
    artist_name = new_file[0]
    # using gsub (global substitute) on a string, can replace the .mp3 with nothing ("")
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
