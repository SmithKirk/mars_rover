require 'plateau'

describe 'Plateau' do

  subject(:plateau) {Plateau.new('5 5')}

  it 'east limit is set correctly' do
    expect(plateau.east_limit).to eq 5
  end

  it 'north limit is set correctly' do
    expect(plateau.north_limit).to eq 5
  end

  it 'west limit is set correctly' do
    expect(plateau.west_limit).to eq 0
  end

  it 'south limit is set correctly' do
    expect(plateau.south_limit).to eq 0
  end
end
