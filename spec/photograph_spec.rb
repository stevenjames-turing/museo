require './lib/photograph'


RSpec.describe Photograph do
  let (:attributes) {{
    id: "1",
    name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "4",
    year: "1954"}}
  let (:photograph) {Photograph.new(attributes)}

  it 'exists' do
    expect(photograph).to be_instance_of Photograph
  end

  it 'initializes with an id, name, artist id, and year' do
    expect(photograph.id).to eq("1")
    expect(photograph.name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
    expect(photograph.artist_id).to eq("4")
    expect(photograph.year).to eq("1954")
  end
end
