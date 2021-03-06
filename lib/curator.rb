class Curator
  require 'csv'

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

  def photographs_taken_by_artist_from(country)
    photographs = []
    photographs_by_artist.each_pair do |key, value|
      photographs << value if key.country == country
    end
    photographs.flatten
  end

  def load_photographs(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    contents.each do |row|
      @photographs << Photograph.new({
        id: row[:id],
        name: row[:name],
        artist_id: row[:artist_id],
        year: row[:year]})
    end
  end

  def load_artists(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    contents.each do |row|
      @artists << Artist.new({
        id: row[:id],
        name: row[:name],
        born: row[:born],
        died: row[:died],
        country: row[:country]})
    end
  end

  def photographs_taken_between(range)
    photos = @photographs.select do |photo|
      range === photo.year.to_i
    end
  end

  def artists_photographs_by_age(artist)
    photos_by_age = {}
    photographs_by_artist.each_pair do |key, value|
      if key == artist
        value.each do |photo|
          photos_by_age[photo.year.to_i - key.born.to_i] = photo.name
        end
      end
    end
    photos_by_age
  end
end
