require "pry"
class Song
  # read & write to attributes
  attr_accessor :name, :artist_name
  # store all instances of song
  @@all = []

  def self.all
    @@all
  end

  # add Song instance to Song.all (self.class = Song)
  def save
    self.class.all << self
  end

  # put Song instance into var, shovel Song onto @@all, and return instance
  def self.create
    song = self.new
    song.save
    song
  end

  # call .create, assign name attribute, and return instance
  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  # 
  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    metadata = filename.gsub('.mp3', '').split(' - ')
    artist_name = metadata[0]
    name = metadata[1]
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
