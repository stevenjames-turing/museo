require './lib/artist'
require './lib/photograph'
require './lib/curator'


RSpec.describe Curator do
  let (:curator) {Curator.new}

  it 'exists' do

    expect(curator).to be_instance_of Curator
  end
end
