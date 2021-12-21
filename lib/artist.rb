require './attributable'

class Artist
  include Attributable

  def age_at_death
    @died.to_i - @born.to_i
  end

end
