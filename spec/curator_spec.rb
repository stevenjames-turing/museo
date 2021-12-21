require './lib/artist'
require './lib/photograph'
require './lib/curator'


RSpec.describe Curator do
  let (:curator) {Curator.new}
  let (:artist_1) {Artist.new({
    id: "1",
    name: "Henri Cartier-Bresson",
    born: "1908",
    died: "2004",
    country: "France"})}
  let (:artist_2) {Artist.new({
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"})}
  let (:photo_1) {Photograph.new({
    id: "1",
    name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "1",
    year: "1954"})}
  let (:photo_2) {Photograph.new({
    id: "2",
    name: "Moonrise, Hernandez",
    artist_id: "2",
    year: "1941"})}

  it 'exists' do
    expect(curator).to be_instance_of Curator
  end

  it 'initializes with no photographs or artists' do
    expect(curator.photographs).to eq([])
    expect(curator.artists).to eq([])
  end

  it 'can add photographs and artists' do
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    expect(curator.photographs).to eq([photo_1, photo_2])
    expect(curator.artists).to eq([artist_1, artist_2])
  end
end
