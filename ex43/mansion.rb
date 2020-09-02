require 'courtyard'
require 'garden'
require 'hallway'
require 'kitchen'
require 'treasury'
require 'barons_room'
require 'maze'

class Mansion
  def initialize()
    @courtyard = Courtyard.new(self)
    @garden = Garden.new(self)
    @hallway = Hallway.new(self)
    @kitchen = Kitchen.new(self)
    @treasury = Treasury.new(self)
    @barons_room = BaronsRoom.new(self)
    @maze = Maze.new(self)
  end

  attr_reader :courtyard
  attr_reader :garden
  attr_reader :hallway
  attr_reader :kitchen
  attr_reader :treasury
  attr_reader :barons_room
  attr_reader :maze
end