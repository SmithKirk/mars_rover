require 'rover'

describe 'Rover' do
  subject(:rover) {Rover.new(4,5,'N')}

  it {is_expected.to respond_to(:location)}

  it 'location is an instance of location' do
    expect(rover.location).to be_an_instance_of(Location)
  end
end
