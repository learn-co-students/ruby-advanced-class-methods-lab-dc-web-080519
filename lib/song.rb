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
    save_song = Song.new
    save_song.save
    save_song
  end

  def self.new_by_name(song_name)
    save_song = Song.new
    save_song.name = song_name
    save_song
  end

  def self.create_by_name(song_name)
    create_song = Song.new
    create_song.name = song_name
    create_song.save
    create_song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    newsong = Song.new
    splitfile = filename.split(/[-.]/)
    newsong.name = splitfile[1].strip
    newsong.artist_name = splitfile[0].strip
    newsong
  end

  def self.create_from_filename(filename)
    newsong = Song.new
    splitfile = filename.split(/[-.]/)
    newsong.name = splitfile[1].strip
    newsong.artist_name = splitfile[0].strip
    newsong.save
    newsong
  end

  def self.destroy_all
    self.all.clear
  end
end
