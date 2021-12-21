require './lib/artist'


RSpec.describe Artist do
  let (:attributes) {{
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"}}
  let (:artist) {Artist.new(attributes)}

  it 'exists' do
    expect(artist).to be_instance_of Artist
  end

  it 'initializes with an id, name, year born/died, and country' do
    expect(artist.id).to eq("2")
    expect(artist.name).to eq("Ansel Adams")
    expect(artist.born).to eq("1902")
    expect(artist.died).to eq("1984")
    expect(artist.country).to eq("United States")
  end

  it 'calculates age at death' do
    expect(artist.age_at_death).to eq(82)
  end
end
