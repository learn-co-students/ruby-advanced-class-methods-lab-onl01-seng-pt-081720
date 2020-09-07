class Song
  attr_accessor :name, :artist_name # accessor allows us to write without a method to a writer
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self # save method saves to the object, calls the self.all method; pushes into all array
  end

  def self.create
    song = self.new # new is being call on self, we need to set it to a var; instatiates the song
    song.save # calls the save method
    song # returns the song
  end

  def self.new_by_name(name)
    song = self.new # instatiates the song
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new #instatiates a new song
    song.name = name
    song.save # save it
    song
  end

  def self.find_by_name(name)
   #binding.pry
    @@all.detect { |song| song.name == name } # returns the first match; same as .find, passes each song object. if the song.name matches, it returns
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) # use || to clean up the method, avoid repetitive code; if/else statement would be repetitive here
  end

  def self.alphabetical
    @@all.sort{ |a, b| a.name <=> b.name } # don't forget the spaceship w/ .sort
    #binding.pry
  end

  def self.new_from_filename(filename) # removes .mp3 from song, split artist name from filename
    # binding.pry
    filename_split = filename.chop.chop.chop.chop.split(" - ") # filename => "thundercat - for love i come.mp3"; chomp removes selected section from str - .delete doesn't work here, replace chomp - chop x 4 (removes last 4 chars), then split.
    song = self.new
    song.name = filename_split[1]
    song.artist_name = filename_split[0]
    song
  end

  def self.create_from_filename(filename) 
    file_split = filename.chop.chop.chop.chop.split(" - ") 
    song = self.new
    song.name = file_split[1]
    song.artist_name = file_split[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear # required changing Song.new -> self.new
  end

end
