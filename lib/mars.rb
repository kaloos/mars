require 'Plateau'
require 'Rover'

class Mars
  MRS_STR_EXIT = "-1"

  def initialize()
    @do_debug = false
  end

  def set_debug(bool_in)
    @do_debug = bool_in
  end

  def puts_debug(str_in)
    if @do_debug
      puts str_in
    end
  end

  def continue_accepting_input(str_in)
    return str_in != MRS_STR_EXIT
  end

  def continue_accepting_input(arr_in)
    return !arr_in.include?(MRS_STR_EXIT)
  end

  def get_plateau_coordinates()
    plateau_x = plateau_y = MRS_STR_EXIT
    puts_debug("Enter plateau x coordinate:")
    plateau_x = gets.chomp
    if continue_accepting_input(plateau_x)
      puts_debug("Enter plateau y coordinate:")
      plateau_y = gets.chomp
    end
    return [plateau_x, plateau_y]
  end

  def get_rover_coordinates()
    rover_x = rover_y = rover_orientation = MRS_STR_EXIT
    puts_debug("Enter rover x coordinate:")
    rover_x = gets.chomp
    if continue_accepting_input(rover_x)
      puts_debug("Enter rover y coordinate:")
      rover_y = gets.chomp
      if continue_accepting_input(rover_y)
        puts_debug("Enter rover orientation:")
        rover_orientation = gets.chomp
      end
    end
    return [rover_x, rover_y, rover_orientation]
  end

  def get_rover_instructions()
    puts_debug("Enter rover instructions:")
    instructions = gets.chomp
    return [instructions]
  end

  def execute()
    # The first line of input is the upper-right coordinates of the plateau
    plateau_coordinates = get_plateau_coordinates()
    # Creating a plateau could throw an exception if the coordinates are of the wrong type
    # However, if the user enters a wrong parameter, the to_i() function will translate
    # the input to zero
    if continue_accepting_input(plateau_coordinates)
      plateau = Plateau.new(plateau_coordinates[0].to_i, plateau_coordinates[1].to_i)
    end
    # Let's get the rovers in
    rover_coordinates = []
    while continue_accepting_input(rover_coordinates) && continue_accepting_input(plateau_coordinates)
      rover = nil
      while continue_accepting_input(rover_coordinates) && rover == nil
        # The first line gives the rover’s position
        # The position is made up of two integers and a letter separated by spaces,
        # corresponding to the x and y co-ordinates and the rover’s orientation
        # We need to make sure that the orientation is a known one
        rover_coordinates = get_rover_coordinates()
        if continue_accepting_input(rover_coordinates)
              begin
                rover = Rover.new(rover_coordinates[0].to_i, rover_coordinates[1].to_i, rover_coordinates[2])
              rescue ArgumentError => e
                puts e.message
              end
          end
        end
        rover_inside_the_plateau = false
        if continue_accepting_input(rover_coordinates) && rover != nil
            # add the rover to the plateau
            # we need to make sure that the rover is inside the plateau
            begin
              plateau.add_rover(rover)
            rescue ArgumentError => e
              puts e.message
            else
              rover_inside_the_plateau = true
            end
          if rover_inside_the_plateau
            # The second line is a series of instructions telling the rover how to explore the plateau
            # if any of the instructions is wrong we will just ignore it
            instructions = get_rover_instructions()
            plateau.move_rover(instructions[0])
            # Each rover finishes sequentially
            puts plateau.rover.get_position()
          else
            rover = nil
          end
        end
      end
  end
end


m = Mars.new
m.set_debug(true)
m.execute
