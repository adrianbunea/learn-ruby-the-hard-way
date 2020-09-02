require 'mansion'
require 'player'
require 'story'

module Game
  def self.start()
    Story.intro()

    mansion = Mansion.new()
    player = Player.new()

    player.go_to(mansion.courtyard)

    while true
      action = prompt(player.actions)
      player.do(action)
    end
  end

  def self.prompt(actions)
    actions.each do |key, value|
      puts "-> #{key}"
    end
  
    print "> "
  
    return gets.chomp()
  end
end