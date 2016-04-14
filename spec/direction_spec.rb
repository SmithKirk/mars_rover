require 'direction'

describe 'Direction' do

  subject(:direction) {Direction.new('N')}

  it {is_expected.to respond_to(:point)}

  it 'initialize with point' do
    expect(direction.point).to eq 'N'
  end

end
