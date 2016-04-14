require 'location'

describe 'Location' do

  subject(:location) {Location.new(4,5)}

  it {is_expected.to respond_to(:x)}

  it {is_expected.to respond_to(:y)}


  it 'initialize with x coordinate' do
    expect(location.x).to eq 4
  end

  it 'x coordinate is an integer' do
    expect(location.x).to be_a_kind_of(Integer)
  end

  it 'initialize with y coordinate' do
    expect(location.y).to eq 5
  end

  it 'y coordinate is an integer' do
    expect(location.y).to be_a_kind_of(Integer)
  end

end
