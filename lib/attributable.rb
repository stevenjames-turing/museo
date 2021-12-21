module Attributable
  attr_reader :id, :name, :artist_id, :year, :born, :died, :country

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @artist_id = attributes[:artist_id]
    @year = attributes[:year]
    @born = attributes[:born]
    @died = attributes[:died]
    @country = attributes[:country]
  end

end
