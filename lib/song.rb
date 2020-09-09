class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #istantiates and saves the song, and it returns the new song that was created
    song = self.new 
    @@all << song
    song
  end

  def self.new_by_name(name) #instantiates a song with a name property
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name) #istantiates and saves a song with a name property
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name) #can find a song present in @@all by name, and can returns falsey when a song name is not present in @@all
    @@all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name) #invokes .find_by_name and .create_by_name instead of repeating code; returns the existing Song object when provided the title of an existing Song
   self.find_by_name(name) || self.create_by_name(name)
 end

 def self.alphabetical() #returns all the song instances in alphabetical order by song name
   @@all.sort_by{|x| x.name}
 end

 def self.new_from_filename(name) #initializes a song and artist_name based on the filename format
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  def self.create_from_filename(name) #initializes and saves a song and artist_name based on the filename format
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all() #clears all the song instances from the @@all array
    @@all.clear
  end

end
