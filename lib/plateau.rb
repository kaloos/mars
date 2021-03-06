require_relative 'Rover'

class Plateau
  PLT_INPUT_ERR01 = 'The value passed is not an integer'
  PLT_INPUT_ERR02 = 'The rover is not inside the plateau!'
  PLT_INPUT_ERR03 = 'A valid rover is needed'
  PLT_INPUT_ERR04 = 'The value passed is not a positive integer'
  attr_reader :max_x, :max_y, :rover

  def initialize (x, y)
    #check x, y are integers
      raise ArgumentError, PLT_INPUT_ERR01 unless x.is_a?(Integer) and y.is_a?(Integer)
    #check x,y are positive integers
    raise ArgumentError, PLT_INPUT_ERR04 unless x>=0 && y>=0
    @max_x = x
    @max_y = y
    @rover = nil
  end

  def is_a_point_inside (x,y)
    #check x, y are integers
    raise ArgumentError, PLT_INPUT_ERR01 unless x.is_a?(Integer) and y.is_a?(Integer)
    #check x,y are positive integers
    #raise ArgumentError, PLT_INPUT_ERR04 unless x>=0 && y>=0
    return x >= 0 && x <= @max_x && y >= 0 && y <= @max_y
  end

  def rover=(value)
    raise ArgumentError, PLT_INPUT_ERR03 unless value!=nil
    raise ArgumentError, PLT_INPUT_ERR02 unless is_a_point_inside(value.x_coordinate,value.y_coordinate)
    @rover = value
  end


end
