class Hallway
  def initialize(mansion)
    @mansion = mansion

    @contexts = {
      :default => {
        "shout" => :shout,
      }
    }

    @current_context = :default
  end

  def actions
    @contexts[@current_context]
  end

  def enter(player)
    puts "entered hallway"
    @current_context = :default
    @player = player
    actions
  end

  def shout()
    @player.shout()

    actions
  end
end