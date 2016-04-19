require 'rover'

describe 'Rover' do
  subject(:rover) {Rover.new('5 5','1 2 N')}

  describe '#status' do
    it "outputs rover\'s position" do
      expect(rover.status).to eq '1 2 N'
    end
  end

  describe '#explore_sequence' do
    it 'follows sequence and finishes in correct position' do
      rover.explore_sequence('LMLMLMLMM')
      expect(rover.status).to eq '1 3 N'
    end
  end

  describe '#action' do
    it 'M command calls #move' do
      rover.action('M')
      expect(rover.position[:y]).to eq 3
    end

    it 'L command calls #turn_left' do
      rover.action('L')
      expect(rover.position[:direction]).to eq 'W'
    end

    it 'R command calls #turn_right' do
      rover.action('R')
      expect(rover.position[:direction]).to eq 'E'
    end
  end

  describe '#turn_left' do
    it 'turn to face west when facing north' do
      rover.turn_left
      expect(rover.position[:direction]).to eq 'W'
    end

    it 'turn to face south when facing east' do
      2.times{rover.turn_left}
      expect(rover.position[:direction]).to eq 'S'
    end

    it 'turn to face east when facing south' do
      3.times{rover.turn_left}
      expect(rover.position[:direction]).to eq 'E'
    end

    it 'turn to face north when facing east' do
      4.times{rover.turn_left}
      expect(rover.position[:direction]).to eq 'N'
    end
  end

  describe '#turn_right' do
    it 'turn to face east when facing north' do
      rover.turn_right
      expect(rover.position[:direction]).to eq 'E'
    end

    it 'turn to face south when facing east' do
      2.times{rover.turn_right}
      expect(rover.position[:direction]).to eq 'S'
    end

    it 'turn to face west when facing south' do
      3.times{rover.turn_right}
      expect(rover.position[:direction]).to eq 'W'
    end

    it 'turn to face north when facing west' do
      4.times{rover.turn_right}
      expect(rover.position[:direction]).to eq 'N'
    end
  end

  describe '#move' do
    it 'if direction is north move to y+1 ' do
      rover.move
      expect(rover.position[:y]).to eq 3
    end

    it 'if direction is south move to y-1' do
      2.times{rover.turn_left}
      rover.move
      expect(rover.position[:y]).to eq 1
    end

    it 'if direction is east move to x+1' do
      rover.turn_right
      rover.move
      expect(rover.position[:x]).to eq 2
    end

    it 'if direction is west move to x-1' do
      rover.turn_left
      rover.move
      expect(rover.position[:x]).to eq 0
    end

    context 'edge of plateau area' do
      before do
        allow(rover).to receive(:cannot_move?).and_return true
      end
      it 'does not move' do
        rover.move
        expect(rover.position[:y]).to eq 2
      end
    end
  end
end
