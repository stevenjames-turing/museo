require './lib/photograph'


RSpec.describe Photograph do
  # let () {}

  it 'exists' do
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    photograph = Photograph.new(attributes)

    expect(photograph).to be_instance_of Photograph
  end

  it 'initializes with an id, name, artist id, and year' do
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    photograph = Photograph.new(attributes)

    expect(photograph.id).to eq("1")
    expect(photograph.name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
    expect(photograph.artist_id).to eq("4")
    expect(photograph.year).to eq("1954")
  end
end
