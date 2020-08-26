$player_inventory = []

def prompt(actions)
  for i in (0...actions.length)
    puts "> #{i}. #{actions[i]}"
  end

  print "> "

  chosen_action_number = gets.chomp.to_i()
  return actions[chosen_action_number]
end

module Courtyard
  @@actions = ["Enter Mansion", "Look around"]

  def self.actions()
    @@actions
  end

  def self.wait()
    while true
      chosen_action = prompt(Courtyard.actions)

      if chosen_action == "Enter Mansion"
        Mansion.enter()
      elsif chosen_action == "Look around"
        Courtyard.explore()
      elsif chosen_action == "Key..."
        Courtyard.key()
      else
        puts "In a moment of unspeakable retardation, you do a backflip and snap your neck on the stairs. You died."
        Process.exit()
      end
    end
  end

  def self.enter()
    puts "You are in the Courtyard, you can enter the King's Mansion."
    Courtyard.wait()
  end

  def self.explore()
    puts "The Courtyard is enormous, guards are posted at every entrance. There is not much to do here."
    puts "You notice a spot of dirt in the grass, looking around, you see a rock that seems to be moved from its place. You look underneath it and you find a key."

    Courtyard.actions.push("Key...")
    Courtyard.actions.delete("Look around")
    Courtyard.key()
    Courtyard.wait()
  end

  def self.key()
    puts "Take the key?"
    chosen_action = prompt(["Yes", "No"])

    if chosen_action == "Yes"
      Courtyard.take_key()
    else
      Courtyard.dont_take_key()
    end

    Courtyard.wait()
  end

  def self.take_key()
    puts "You take the key and stick it...somewhere safe."
    $player_inventory.push("key_to_the_kitchen")
    Courtyard.actions.delete("Key...")
  end
  
  def self.dont_take_key()
    puts "You decide to not touch other people's stuff and leave the key where you found it."
  end
end

module Mansion
  @@actions = ["Go to Courtyard", "Look around"]
  @@is_dog_hungry = true

  def self.actions()
    @@actions
  end

  def self.wait()
    while true
      chosen_action = prompt(Mansion.actions)

      if chosen_action == "Go to Courtyard"
        Courtyard.enter()
      elsif chosen_action == "Go to Kitchen"
        Kitchen.enter()
      elsif chosen_action == "Go to room #1"
        KingsBedroom.enter()
      elsif chosen_action == "Go to the room guarded by the dog"
        Mansion.enter_princess_bedroom()
      elsif chosen_action == "Look around"
        Mansion.explore()
      elsif chosen_action == "Guard dog..."
        Mansion.dog()
      else
        puts "Overwhelmed by too many choices, you do the only rational thing and select the non-existant option."
      end
    end
  end

  def self.enter()
    puts "You are in the Mansion, in the main hallway."
    Mansion.wait()
  end

  def self.explore()
    puts "The Hallway is long, there are doors to different rooms, you don't know what all of these lead to, except for one opened door that leads to the kitchen."
    puts "Another door is guarded by a dog. The dog is huge, not sure if it's a bear."

    Mansion.actions.push("Go to Kitchen")
    Mansion.actions.push("Go to the room guarded by the dog")
    Mansion.actions.push("Go to room #1")
    Mansion.actions.push("Guard dog...")
    Mansion.actions.delete("Look around")
    Mansion.wait()
  end

  def self.dog()
    puts "You come closer to the dog to get a better look. The dog notices you and starts growling, better step away."

    if $player_inventory.include?("chunk_of_meat")
      Mansion.maybe_feed_dog()
    end
  end

  def self.maybe_feed_dog()
    puts "The meat you got from the kitchen might please him."
    puts "Give the meat to the dog?"
    chosen_action = prompt(["Yes", "No"])

    if chosen_action == "Yes"
      Mansion.feed_dog()
    elsif chosen_action == "No"
      puts "Maybe the dog is vegan."
    else
      puts "You start spazzing out of control and hit the dog by mistake. Angered, the dog rips you to shreds. You died."
      Process.exit(0)
    end
  end

  def self.feed_dog()
    puts "You throw the dog meat from your packpack. The dog swallows it whole. Grateful, the dog moves out of the way, as if inviting you to enter the room it was guarding."
    @@is_dog_hungry = false
    $player_inventory.delete("chunk_of_meat")
  end

  def self.enter_princess_bedroom()
    if @@is_dog_hungry
      puts "The dog rips you apart before you even get the chance to put your hand on the door handle. The pains is excruciating. You died."
      Process.exit(0)
    else
      PrincessBedroom.enter()
    end
  end
end

module Kitchen
  @@actions = ["Go back to hallway", "Look around"]
  @@is_larder_locked = true

  def self.actions()
    @@actions
  end

  def self.wait()
    while true
      chosen_action = prompt(Kitchen.actions)

      if chosen_action == "Go back to hallway"
        Mansion.enter()
      elsif chosen_action == "Look around"
        Kitchen.explore()
      elsif chosen_action == "Larder..."
        Kitchen.larder()
      else
        puts "You remember the Computer Science courses back when you were a student. You also remember that arrays start at 0, just like these answers."
      end
    end
  end

  def self.enter()
    puts "You are in the Kitchen. It is full of pans, plates, knives and other kitchen stuff."
    Kitchen.wait()
  end

  def self.explore()
    puts "You look around the Kitchen. You notice a door in the back of the room, it's probably the larder."
    
    Kitchen.actions.delete("Look around")
    Kitchen.actions.push("Larder...")
    Kitchen.wait()
  end

  def self.larder()
    puts "Open the larder?"
    chosen_action = prompt(["Yes", "No"])

    if chosen_action == "Yes"
      Kitchen.open_larder()
    else
      puts "You decide not to stick your nose."
    end

    puts "You close the door to the larder."
    Kitchen.wait()
  end

  def self.open_larder()
    puts "You turn the handle on the door but the door is locked."

    if @@is_larder_locked
      Kitchen.locked_larder()
    else
      Kitchen.inspect_larder()
    end
  end

  def self.locked_larder()
    has_key = $player_inventory.include?("key_to_the_kitchen")

    if has_key
      Kitchen.maybe_use_key()
    else
      puts "You have no idea where the key might be."
    end
  end

  def self.maybe_use_key()
    puts "The key from the courtyard might be used for this lock. Use it?"
    chosen_action = prompt(["Yes", "No"])

    if chosen_action == "Yes"
      Kitchen.unlock_larder_door()
    elsif chosen_action == "No"
      Kitchen.dont_unlock_larder_door()
    else
      puts "You scratch your head, unsure what the hell you're thinking."
    end
  end

  def self.unlock_larder_door()
    puts "You stick it in the keyhole and twist. The lock opens with a click to announce your glorious success."
    @@is_larder_locked = false
    $player_inventory.delete("key_to_the_kitchen")
    Kitchen.inspect_larder()
  end

  def self.dont_unlock_larder_door()
    puts "'It won't unlock it.' you think to yourself, as you stick the key back in your...safe place."
  end

  def self.inspect_larder()
    if $player_inventory.include?("chunk_of_meat")
      puts "You already took some meat, let's not get greedy."
    else
      Kitchen.maybe_take_meat()
    end
  end

  def self.maybe_take_meat()
    puts "In the larder there is a big chunk of meat, looks tasty. Take the meat?"
    chosen_action = prompt(["Yes", "No"])

    if chosen_action == "Yes"
      Kitchen.take_meat()
    elsif chosen_action == "No"
      Kitchen.dont_take_meat()
    else
      puts "Do you want the meat or not?"
    end
  end

  def self.take_meat()
    $player_inventory.push("chunk_of_meat")
  end

  def self.dont_take_meat()
    puts "You're not hungry."
  end
end

module PrincessBedroom
  def self.enter()
    puts "You are in a room that looks like someone's bedroom. The room is very dark and nothing can be seen. After you eyes get used to the dark you begin to see a silhouette. The Princess was waiting for you. Time to get paid ( ͡° ͜ʖ ͡°)"
    puts "Congratulations, you win!"
    Process.exit(0)
  end
end

module KingsBedroom
  def self.enter()
    puts "You are in a room that looks like someone's bedroom. The room is very dark and nothing can be seen. Right after your eyes get used to the dark, the lights get turned on and they blind you for a moment. When you open your eyes you see the horror: the King was here, waiting for you, ready to smash ( ͡° ͜ʖ ͡°)"
    puts "The next few hours are a nightmare, pain and bliss, but above all, terror. You don't fear the King ravaging your body, but the thought that you might actually enjoy it."
    puts "GAME OVER"
    Process.exit(0)
  end
end

puts "Today is the day you visit your girlfriend's house. The only problem, she's the King's daughter, and he hates your guts. But that's not gonna stop you."
puts "You have a goal, infiltrate the King's Mansion during the night, and pay the Princess a visit. The plan is simple: get in, get ass, and get out."
puts "You begin the mission by jumping the fence into the mansion's courtyard."

Courtyard.enter()
