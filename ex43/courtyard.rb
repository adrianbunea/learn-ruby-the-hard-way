require 'mansion' 

class Courtyard
  def initialize(mansion)
    @mansion = mansion

    @contexts = {
      :default => {
        "enter mansion" => :enter_mansion,
        "shout" => :shout,
        "look around" => :look_around
      }
    }

    @current_context = :default
  end

  def actions
    @contexts[@current_context]
  end

  def enter(player)
    puts "entered courtyard"
    @current_context = :default
    @player = player
    @player.context = self
  end

  def enter_mansion()
    @player.go_to(@mansion.hallway)
    #@player = nil
  end

  def enter_maze()
    @player.go_to(@mansion.maze)
    #@player = nil
  end

  def shout()
    @player.shout()

    actions
  end

  def look_around()
    puts <<~DESCRIPTION
    You scan the darkness for guards, traps or anything worth taking with you. 
    Guards are posted at every entrance to the [Courtyard], and in the back you see the entrance 
    to the maze, it might be worth checking out.
    DESCRIPTION
    
    actions["enter maze"] = :enter_maze
    actions.delete("look around")
  end
end