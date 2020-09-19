class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self #pushes whatever it is into the @@all
  end

def self.create
  song = self.new # built in method
  song.save  
  song
  
end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end #created one 
  
  
  def self.create_by_name(name)
  song = self.new
  song.name = name 
  song.save
  song
end #then save it 

def self.find_by_name(name) #now we are finding the songs 
##binginding.pry #used binding pry to get one of the songs out 
 @@all.detect{ |song| song.name == name}
 #find an array of objects, could've used .find
 # |song| each song object, going to pass them in 
 #grabbing element from array and returning it 
 end
 
 
def self.find_or_create_by_name(name)
#   if self.find_by_name(name)
#     self.find_by_name(name)
#   else 
#     self.create_by_name(name)
# end

self.find_by_name(name) || self.create_by_name(name)
end
# to stop it from repeating 

def self.alphabetical  #return it all in alphabetical order
@@all.sort{ |a,b| a.name <=> b.name }
#going through ruby telling it to sort by name 
# <=> spaceship method   
#another way is to use @@sort_by{ |song| song.name }
#easier to remember! ^
end

def self.new_from_filename(filename)
  # split_filename = filename.chomp(".mp3").split(" - ")
  split_filename = filename.chop.chop.chop.chop.split(" - ")
  #first element is artist and second element is the song 
  song = Song.new
  song.name = split_filename[1]
  song.artist_name = split_filename[0]
  song
end

def self.create_from_filename(filename)
  # split_filename = filename.chomp(".mp3").split(" - ")
  split_filename = filename.chop.chop.chop.chop.split(" - ")
  #first element is artist and second element is the song 
  song = Song.new
  song.name = split_filename[1]
  song.artist_name = split_filename[0]
  song.save
  song
end




def self.destroy_all
  self.all.clear
  # or I can do @@all.clear 
end

end 



#saving to the object. Self is the object, the class method is @@all. We are calling the class method through the instance method 