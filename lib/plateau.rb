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

  def add_rover(rover)
    raise ArgumentError, PLT_INPUT_ERR03 unless rover!=nil
    if is_a_point_inside(rover.x_coordinate,rover.y_coordinate)
      @rover = rover
    else
      raise ArgumentError, PLT_INPUT_ERR02
    end
  end

  def move_rover(instructions)
    instructions.each_char do |each_character|
      case each_character
        when 'R' then rover.turn_right
        when 'L' then rover.turn_left
        when 'M' then rover.move_forward(max_x, max_y)
      end
    end
  end

end
