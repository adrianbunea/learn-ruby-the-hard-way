require 'guard'

class Maze
  def initialize(mansion)
    @mansion = mansion

    @contexts = {
      :default => {
        "return to courtyard" => :enter_courtyard,
        "shout" => :shout,
        "look around" => :look_around
      },
      :tired_guard => {
        "walk away" => :walk_away_from_guard,
        "confront" => :confront_guard,
        "attack" => :attack_guard,
        "steal key" => :steal_key
      },
      :stealing_keys => {
        "pull harder" => :pull_harder,
        "try something else" => :change_strategy
      },
      :dead_guard => {
        "loot key" => :loot_key,
        "walk away" => :walk_away_from_corpse
      }
    }

    @current_context = :default
  end

  def actions
    @contexts[@current_context]
  end

  def enter(player)
    puts "entered maze"
    @current_context = :default
    @player = player
    @player.context = self
  end

  def enter_courtyard()
    @player.go_to(@mansion.courtyard)
    # @player = nil
  end

  def shout()
    @player.shout()

    actions
  end

  def look_around()
    puts <<~DESCRIPTION
    You wander inside the maze for a while, keeping track of the turns you took, so you don't get lost.
    Eventually you see a faint light behind a corner. You carefully approach the corner and look for the source,
    to your surprise, you see a tired soldier leaning on a tree, with his lamp in his hand. On his belt you
    notice a keychain with one big key, surely it must be important. You stop for a second to consider your
    options.
    DESCRIPTION
    
    actions.delete("look around")
    actions["guard..."] = :guard
    @current_context = :tired_guard
    puts actions
  end

  def walk_away_from_guard()
    puts <<~DESCRIPTION
    You decide not to meddle with the guard.
    DESCRIPTION

    @current_context = :default
  end

  def change_strategy()
    puts <<~DESCRIPTION
    You decide to not take any risks and rethink your strategy.
    DESCRIPTION
    
    @current_context = :tired_guard
    actions.delete("steal key")
    actions["try harder to steal the key"] = :pull_harder
  end

  def steal_key()
    puts <<~DESCRIPTION
    You move around the guard, making sure to stay where the light is weaker, until you get behind him. You silently
    approach the guard and grab the key. To your surprise, the key is safely tied to the keychain, and the keychain
    does not budge from his belt. Clearly this key is important, but taking them without alerting him does not look possible.
    DESCRIPTION

    @current_context = :stealing_keys
  end

  def pull_harder()
    puts <<~DESCRIPTION
    Annoyed, you try to yank the keys from the keychain. The guard is startled, and turns towards you. He immediatelly
    pulls out his sword and prepares to strike you.
    DESCRIPTION

    guard = Guard.new()
    @player.fight(guard)
    @current_context = :default
    actions.delete("guard...")
    actions["guard corpse..."] = :guard_corpse
  end

  def guard()
    @current_context = :tired_guard
  end

  def guard_corpse()
    puts "The guard is lying dead on the ground."
    @current_context = :dead_guard
  end

  def loot_key()
    puts <<~DESCRIPTION
    You take the keys off the guard's corpse.
    DESCRIPTION

    @player.inventory.push("keys")
    actions.delete(:loot_keys)
  end

  def walk_away_from_corpse()
    @current_context = :default
  end
end