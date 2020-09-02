class Player
  attr_accessor :context

  def initialize()
    @inventory = []
    @shouts = ["AAAAHH!!!", "EEEP!!!", "HEY!!!!"]
  end

  def actions()
    @context.actions
  end

  def do(action)
    method = @context.actions[action]
    @context.public_send(method)
  end

  def go_to(room)
    room.enter(self)
  end

  def fight(opponent)
    opponent.engage(self)
  end

  def shout()
    puts @shouts[rand(@shouts.length)]
  end

  def has_weapon?()
    return @inventory.include?("dagger")
  end
end