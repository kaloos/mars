require 'Rover'

RSpec.describe 'A rover' do
  ROV_MAX_X = 2
  ROV_MAX_Y = 3

  it 'should be created with two integers and a proper orientation' do
    rover = Rover.new(ROV_MAX_X,ROV_MAX_Y,"N")
    expect(rover).not_to eq(nil)
  end
  it 'should not be created with non integer parameters (1)' do
    expect {
      rover = Rover.new(ROV_MAX_X.to_f,ROV_MAX_Y,"N")
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with non integer parameters (2)' do
    expect {
      rover = Rover.new(ROV_MAX_X,ROV_MAX_Y.to_f,"N")
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with a non proper orientation' do
    expect {
      rover = Rover.new(ROV_MAX_X,ROV_MAX_Y,'X')
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (1)' do
    expect {
      rover = Rover.new(nil,ROV_MAX_Y,'N')
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (2)' do
    expect {
      rover = Rover.new(ROV_MAX_X,nil,'N')
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (3)' do
    expect {
      rover = Rover.new(ROV_MAX_X,ROV_MAX_Y,nil)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (4)' do
    expect {
      rover = Rover.new(nil,nil,nil)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with negative integers' do
    expect {
      rover = Rover.new(-1,ROV_MAX_Y,'N')
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with negative integers (2)' do
    expect {
      rover = Rover.new(ROV_MAX_X,-1,'N')
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with negative integers (3)' do
    expect {
      rover = Rover.new(-1,-1,'N')
    }.to raise_error(ArgumentError)
  end

  before :each do
      @rover = Rover.new(ROV_MAX_X,ROV_MAX_Y,"N")
  end

  # Turning tests
  it 'should properly turn left' do
    @rover.turn_left
    expect(@rover.orientation).to eq("W")
  end
  it 'should properly turn left twice' do
    @rover.turn_left
    @rover.turn_left
    expect(@rover.orientation).to eq("S")
  end
  it 'should properly turn left three times' do
    @rover.turn_left
    @rover.turn_left
    @rover.turn_left
    expect(@rover.orientation).to eq("E")
  end
  it 'should properly turn left four times' do
    @rover.turn_left
    @rover.turn_left
    @rover.turn_left
    @rover.turn_left
    expect(@rover.orientation).to eq("N")
  end
  it 'should properly turn right' do
    @rover.turn_right
    expect(@rover.orientation).to eq("E")
  end
  it 'should properly turn right twice' do
    @rover.turn_right
    @rover.turn_right
    expect(@rover.orientation).to eq("S")
  end
  it 'should properly turn right three times' do
    @rover.turn_right
    @rover.turn_right
    @rover.turn_right
    expect(@rover.orientation).to eq("W")
  end
  it 'should properly turn left four times' do
    @rover.turn_right
    @rover.turn_right
    @rover.turn_right
    @rover.turn_right
    expect(@rover.orientation).to eq("N")
 end

 # Move forward tests
 it 'should move forward-stay where it is' do
   @rover.move_forward(ROV_MAX_X, ROV_MAX_Y)
   expect(@rover.get_position).to eq("#{ROV_MAX_X}-#{ROV_MAX_Y}-N")
 end
 it 'should properly move forward-move south' do
   @rover.turn_right
   @rover.turn_right
   @rover.move_forward(ROV_MAX_X, ROV_MAX_Y)
   expect(@rover.get_position).to eq("#{ROV_MAX_X}-#{ROV_MAX_Y-1}-S")
 end
 it 'should properly move forward-move west' do
   @rover.turn_left
   @rover.move_forward(ROV_MAX_X, ROV_MAX_Y)
   expect(@rover.get_position).to eq("#{ROV_MAX_X-1}-#{ROV_MAX_Y}-W")
 end
 it 'should properly move forward-move north' do
   @rover.turn_left
   @rover.move_forward(ROV_MAX_X, ROV_MAX_Y)
   @rover.turn_left
   @rover.move_forward(ROV_MAX_X, ROV_MAX_Y)
   expect(@rover.get_position).to eq("#{ROV_MAX_X-1}-#{ROV_MAX_Y-1}-S")
 end
end
