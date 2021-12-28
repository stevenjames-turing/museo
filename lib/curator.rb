class Curator

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    artist = @artists.select do |artist|
      artist.id == id
    end
    artist[0]
  end

  def photographs_by_artist
    photographs_by_artist = {}
    @photographs.each do |photo|
      if !photographs_by_artist.has_key?(find_artist_by_id(photo.artist_id))
        photographs_by_artist[find_artist_by_id(photo.artist_id)] = [photo]
      elsif photographs_by_artist.has_key?(find_artist_by_id(photo.artist_id))
        photographs_by_artist[find_artist_by_id(photo.artist_id)] << photo
      end
    end
    photographs_by_artist
  end

  def artists_with_multiple_photographs
    artists = []
    photographs_by_artist.select do |key, value|
      artists << key.name if value.count > 1
    end
    artists
  end
end
