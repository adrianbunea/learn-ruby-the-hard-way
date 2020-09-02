class Guard
  attr_reader :contexts
  def initialize()
    @alarm_timer = 0
    @swings = ["sideways", "overhead"]

    @contexts = {
      :sideways_swing => {
        "duck" => :good_dodge,
        "jump away" => :stalemate,
        "dodge to the side" => :bad_dodge
      },
      :overhead_swing => {
        "duck" => :bad_dodge,
        "jump away" => :stalemate,
        "dodge to the side" => :good_dodge
      },
      :can_kill => {
        "stab" => :kill,
        "..." => :hesitate
      }
    }
  end

  def actions
    @contexts[@current_context]
  end

  def engage(opponent)
    puts "engaged guard"
    @player = opponent
    @previous_context = @player.context
    @player.context = self

    strike()
  end

  def strike()
    if @alarm_timer == 4
      puts <<~DESCRIPTION
      The prolonged fighting finally wakes up the guard completely, before going for another attack, he
      realizes he has a job and pulls out a bell from his bag, yelling "ALARM!!! while ringing from the bell.
      Lights turn on all around you, and you hear more guards rushing to your spot. In a few seconds you are
      surrounded with no way of escape. The guards order you to get on the ground #{@player.has_weapon?() ? "and throw away your weapon": ""},
      then proceed to arrest you. Tonight's mission is a failure.
      DESCRIPTION
      Process.exit(0)
    else
      @alarm_timer += 1
      swing = @swings[rand(@swings.length)]

      if swing == "sideways"
        puts "The guard prepares a wide sideways swing."
        @current_context = :sideways_swing
      else
        puts "The guard raises his weapon for an overhead strike."
        @current_context = :overhead_swing
      end
    end
  end

  def good_dodge()
    puts "With minimal movements, you avoid the swing from the guard."

    if !@player.has_weapon?
      @current_context = :can_kill
    else
      puts "The guard is open for a quick attack, however you have no weapon to do so."
      strike()  
    end
  end

  def stalemate()
    print "You take a leap behind you to avoid the swing. However, you cannot close in the distance to the guard before he swings again."
    strike()
  end

  def bad_dodge()
    if @current_context == :sideways_swing
      puts "You dodged to the side, however this was not enough to avoid the arc of the swing. The sword slices your arm and your stomach, you fall to the ground and eventually bleed to death."
    else
      puts "You duck, however this only makes the guard's overhead swing gather more momentum. The sword reaches the tip of your head like a guillotine. You feel a sharp pain in your head, and then nothing."
    end

    Process.exit(0)
  end

  def kill()
    puts "Your efficient dodge leaves you enough time for a quick attack of your own while the guard is still recovering from their wide swing. You take advantage of this and stab the guard in the neck, bringing a swift end to the man's career."
    @player.context = @previous_context
  end

  def hesitate()
    puts "Before you can make up your mind, the guard is already prepared. He begins another swing at you."
    strike()
  end
end