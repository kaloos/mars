require 'Plateau'

RSpec.describe 'A plateau' do
  MAX_PLATEAU_X = 5
  MAX_PLATEAU_Y = 5

  it 'should be created with two integers' do
    plateau = Plateau.new(MAX_PLATEAU_X,MAX_PLATEAU_Y)
    expect(plateau).not_to eq(nil)
  end
  it 'should not be created with non integer parameters (1)' do
    expect {
      plateau = Plateau.new(MAX_PLATEAU_X.to_f,MAX_PLATEAU_Y)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with non integer parameters (2)' do
    expect {
      plateau = Plateau.new(MAX_PLATEAU_X,MAX_PLATEAU_Y.to_f)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with non integer parameters (3)' do
    expect {
      plateau = Plateau.new(MAX_PLATEAU_X.to_f,MAX_PLATEAU_Y.to_f)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (1)' do
    expect {
      plateau = Plateau.new(MAX_PLATEAU_X,nil)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (2)' do
    expect {
      plateau = Plateau.new(nil,MAX_PLATEAU_Y)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with nil parameters (3)' do
    expect {
      plateau = Plateau.new(nil,nil)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with negative integers' do
    expect {
      plateau = Plateau.new(-1,MAX_PLATEAU_Y)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with negative integers (2)' do
    expect {
      plateau = Plateau.new(MAX_PLATEAU_X,-1)
    }.to raise_error(ArgumentError)
  end
  it 'should not be created with negative integers (3)' do
    expect {
      plateau = Plateau.new(-1,-1)
    }.to raise_error(ArgumentError)
  end

  before :each do
    @plateau = Plateau.new(MAX_PLATEAU_X,MAX_PLATEAU_Y)
  end
  it 'should be able to accept a rover inside the plateau' do
    rover = Rover.new(MAX_PLATEAU_X,MAX_PLATEAU_Y,"N")
    @plateau.rover = rover
    expect(@plateau).not_to eq(nil)
  end
  it 'should not be able to accept a rover outside the plateau (1)' do
    rover = Rover.new(MAX_PLATEAU_X+1,MAX_PLATEAU_Y,"N")
    expect {
      @plateau.rover = rover
    }.to raise_error(ArgumentError)
  end
  it 'should not be able to accept a rover outside the plateau (2)' do
    rover = Rover.new(MAX_PLATEAU_X,MAX_PLATEAU_Y+1,"N")
    expect {
      @plateau.rover = rover
    }.to raise_error(ArgumentError)
  end
  it 'should not be able to accept a rover outside the plateau (3)' do
    rover = Rover.new(MAX_PLATEAU_X+1,MAX_PLATEAU_Y+1,"N")
    expect {
      @plateau.rover = rover
    }.to raise_error(ArgumentError)
  end
  it 'should not be able to accept a non valid rover' do
    expect {
      @plateau.rover = nil
    }.to raise_error(ArgumentError)
  end

  #Perform input moves
  it 'should run example 1' do
    rover = Rover.new(1,2,"N")
    @plateau.rover = rover
    @plateau.rover.move("L M L M L M L M M",@plateau.max_x,@plateau.max_y)
    expect(@plateau.rover.get_position).to eq("#{1}-#{3}-N")
  end
  it 'should run example 2' do
    rover = Rover.new(3,3,"E")
    @plateau.rover = rover
    @plateau.rover.move("M M R M M R M R R M", @plateau.max_x,@plateau.max_y)
    expect(@plateau.rover.get_position).to eq("#{5}-#{1}-E")
  end
  it 'should run example 3' do
    rover = Rover.new(3,3,"E")
    @plateau.rover = rover
    @plateau.rover.move("M M M M M M", @plateau.max_x,@plateau.max_y)
    expect(@plateau.rover.get_position).to eq("#{MAX_PLATEAU_X}-#{3}-E")
  end
  it 'should run example 4' do
    rover = Rover.new(3,3,"W")
    @plateau.rover = rover
    @plateau.rover.move("M M M M M M", @plateau.max_x,@plateau.max_y)
    expect(@plateau.rover.get_position).to eq("#{0}-#{3}-W")
  end
  it 'should run example 5' do
    rover = Rover.new(2,2,"W")
    @plateau.rover = rover
    @plateau.rover.move("M R R M R M", @plateau.max_x,@plateau.max_y)
    expect(@plateau.rover.get_position).to eq("#{2}-#{1}-S")
  end
end
