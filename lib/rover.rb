class Rover
  ROV_INPUT_ERR01 = 'The value passed is not an integer'
  ROV_INPUT_ERR02 = 'The value passed is not a proper rover orientation'
  ROV_INPUT_ERR03 = 'The value passed is not a positive integer'

  attr_reader :x_coordinate, :y_coordinate, :orientation


  def initialize (x, y, orientation)
    #check x, y are integers
    raise ArgumentError, ROV_INPUT_ERR01 unless x.is_a?(Integer) and y.is_a?(Integer)
    #check orientation has one of the proper values
    raise ArgumentError, ROV_INPUT_ERR02 unless ['N','S','E','W'].include?(orientation)
    #check x,y are positive integers
    raise ArgumentError, ROV_INPUT_ERR03 unless x>=0 && y>=0
    @x_coordinate = x
    @y_coordinate = y
    @orientation = orientation
  end

  def get_position()
    "#{@x_coordinate}-#{@y_coordinate}-#{@orientation}"
  end

  # When turning right or left, in case
  # the instruction is unclear (none of the known values)
  # the orientation remains as is
  def turn_left
        case @orientation
          when "N" then @orientation = "W"
          when "S" then @orientation = "E"
          when "E" then @orientation = "N"
          when "W" then @orientation = "S"
        end
  end

  def turn_right
    case @orientation
        when "N" then @orientation = "E"
        when "S" then @orientation = "W"
        when "E" then @orientation = "S"
        when "W" then @orientation = "N"
    end
  end

  def move_forward (max_x, max_y)
      case @orientation
        when "N"
          if @y_coordinate < max_y
            @y_coordinate = @y_coordinate +1
          end
        when "S"
          if @y_coordinate > 0
            @y_coordinate = @y_coordinate - 1
          end
        when "E" then
          if @x_coordinate < max_x
            @x_coordinate = @x_coordinate + 1
          end
        when "W" then
          if @x_coordinate > 0
            @x_coordinate = @x_coordinate - 1
          end
      end
  end
end
