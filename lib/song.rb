require "pry"
class Song
  # read & write to attributes
  attr_accessor :name, :artist_name
  # store all instances of song
  @@all = []

  def self.all
    @@all
  end

  # add Song instance to Song.all (self.class = Song) and return the instance
  def save
    self.class.all << self
    self
  end

  # make a new Song instance and save it into the .all array
  def self.create
    song = self.new
    song.save
  end

  # make a new Song instance, assign its name attribute, and return instance
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  # make a new Song instance with name attribute assigned and save it
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end

  # loop over Song.all to find song with name value matching argument
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  # if .find_by_name gets a hit, return it, otherwise call .create_by_name on the argument
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  # return Song.all sorted by name values
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    # remove '.mp3' from argument and split artist & title into separate array elements
    metadata = filename.gsub('.mp3', '').split(' - ')
    # save artist and title into variables
    artist_name = metadata[0]
    name = metadata[1]
    # create new instance
    song = self.new_by_name(name)
    # write artist_name value using saved var
    song.artist_name = artist_name
    # return Song instance
    song
  end

  # make a new Song instance by processing filename and save it
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  # empty array of all Song instances
  def self.destroy_all
    self.all.clear
  end
end
