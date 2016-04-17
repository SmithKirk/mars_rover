require 'location'

describe 'Location' do

  subject(:location) {Location.new(4,5,'N','5 5')}

  it {is_expected.to respond_to(:point)}

  it 'initialize with point' do
    expect(location.point).to eq 'N'
  end

  describe '#turn_left' do

    it 'turn to face west when facing north' do
      location.turn_left
      expect(location.point).to eq 'W'
    end

    it 'turn to face south when facing east' do
      location.turn_left
      location.turn_left
      expect(location.point).to eq 'S'
    end

    it 'turn to face east when facing south' do
      location.turn_left
      location.turn_left
      location.turn_left
      expect(location.point).to eq 'E'
    end

    it 'turn to face north when facing east' do
      location.turn_left
      location.turn_left
      location.turn_left
      location.turn_left
      expect(location.point).to eq 'N'
    end
  end

  describe '#turn_right' do

    it 'turn to face east when facing north' do
      location.turn_right
      expect(location.point).to eq 'E'
    end

    it 'turn to face south when facing east' do
      location.turn_right
      location.turn_right
      expect(location.point).to eq 'S'
    end

    it 'turn to face west when facing south' do
      location.turn_right
      location.turn_right
      location.turn_right
      expect(location.point).to eq 'W'
    end

    it 'turn to face north when facing west' do
      location.turn_right
      location.turn_right
      location.turn_right
      location.turn_right
      expect(location.point).to eq 'N'
    end
  end

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

  describe '#move' do

    it 'if point is north move to y+1 ' do
      location.move
      expect(location.y).to eq 6
    end

    it 'if point is south move to y-1' do
      location.turn_left
      location.turn_left
      location.move
      expect(location.y).to eq 4
    end

    it 'if point is east move to x+1' do
      location.turn_right
      location.move
      expect(location.x).to eq 5
    end

    it 'if point is west move to x-1' do
      location.turn_left
      location.move
      expect(location.x).to eq 3
    end
  end
end
