require 'direction'

describe 'Direction' do

  subject(:direction) {Direction.new('N')}

  it {is_expected.to respond_to(:point)}

  it 'initialize with point' do
    expect(direction.point).to eq 'N'
  end

  describe '#turn_left' do

    it 'turn to face west when facing north' do
      direction.turn_left
      expect(direction.point).to eq 'W'
    end

    it 'turn to face south when facing east' do
      direction.turn_left
      direction.turn_left
      expect(direction.point).to eq 'S'
    end

    it 'turn to face east when facing south' do
      direction.turn_left
      direction.turn_left
      direction.turn_left
      expect(direction.point).to eq 'E'
    end

    it 'turn to face north when facing east' do
      direction.turn_left
      direction.turn_left
      direction.turn_left
      direction.turn_left
      expect(direction.point).to eq 'N'
    end
  end

  describe '#turn_right' do

    it 'turn to face east when facing north' do
      direction.turn_right
      expect(direction.point).to eq 'E'
    end

    it 'turn to face south when facing east' do
      direction.turn_right
      direction.turn_right
      expect(direction.point).to eq 'S'
    end

    it 'turn to face west when facing south' do
      direction.turn_right
      direction.turn_right
      direction.turn_right
      expect(direction.point).to eq 'W'
    end

    it 'turn to face north when facing west' do
      direction.turn_right
      direction.turn_right
      direction.turn_right
      direction.turn_right
      expect(direction.point).to eq 'N'
    end
  end
end
