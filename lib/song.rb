require('pry')
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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
     song = self.new
     song.name = song_name
     song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end


  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort do |element_a, element_b|
      element_a.name <=> element_b.name
    end
    return sorted
  end

  def self.new_from_filename(filename)
    split_song = filename.split(" - ")
    song_artist = split_song[0]
    split_even_further = split_song[1].split(".")
    song_name = split_even_further[0]
    this_song = self.new
    this_song.name = song_name
    this_song.artist_name = song_artist
    return this_song
  end

  def self.create_from_filename(filename)
    split_song = filename.split(" - ")
    song_artist = split_song[0]
    split_even_further = split_song[1].split(".")
    song_name = split_even_further[0]
    this_song = self.create
    this_song.name = song_name
    this_song.artist_name = song_artist
    return this_song
  end

  def self.destroy_all
    self.all.clear
  end

end
