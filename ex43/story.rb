module Story
  TITLE = <<-TITLE
▄▄▄█████▓ ██░ ██  ██▓▓█████   █████▒    ██▓ ███▄    █    ▄▄▄█████▓ ██░ ██ ▓█████     ███▄    █  ██▓  ▄████  ██░ ██ ▄▄▄█████▓
▓  ██▒ ▓▒▓██░ ██▒▓██▒▓█   ▀ ▓██   ▒    ▓██▒ ██ ▀█   █    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀     ██ ▀█   █ ▓██▒ ██▒ ▀█▒▓██░ ██▒▓  ██▒ ▓▒
▒ ▓██░ ▒░▒██▀▀██░▒██▒▒███   ▒████ ░    ▒██▒▓██  ▀█ ██▒   ▒ ▓██░ ▒░▒██▀▀██░▒███      ▓██  ▀█ ██▒▒██▒▒██░▄▄▄░▒██▀▀██░▒ ▓██░ ▒░
░ ▓██▓ ░ ░▓█ ░██ ░██░▒▓█  ▄ ░▓█▒  ░    ░██░▓██▒  ▐▌██▒   ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄    ▓██▒  ▐▌██▒░██░░▓█  ██▓░▓█ ░██ ░ ▓██▓ ░ 
  ▒██▒ ░ ░▓█▒░██▓░██░░▒████▒░▒█░       ░██░▒██░   ▓██░     ▒██▒ ░ ░▓█▒░██▓░▒████▒   ▒██░   ▓██░░██░░▒▓███▀▒░▓█▒░██▓  ▒██▒ ░ 
  ▒ ░░    ▒ ░░▒░▒░▓  ░░ ▒░ ░ ▒ ░       ░▓  ░ ▒░   ▒ ▒      ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░   ░ ▒░   ▒ ▒ ░▓   ░▒   ▒  ▒ ░░▒░▒  ▒ ░░   
    ░     ▒ ░▒░ ░ ▒ ░ ░ ░  ░ ░          ▒ ░░ ░░   ░ ▒░       ░     ▒ ░▒░ ░ ░ ░  ░   ░ ░░   ░ ▒░ ▒ ░  ░   ░  ▒ ░▒░ ░    ░    
  ░       ░  ░░ ░ ▒ ░   ░    ░ ░        ▒ ░   ░   ░ ░      ░       ░  ░░ ░   ░         ░   ░ ░  ▒ ░░ ░   ░  ░  ░░ ░  ░      
          ░  ░  ░ ░     ░  ░            ░           ░              ░  ░  ░   ░  ░            ░  ░        ░  ░  ░  ░         
                                                                                                                            
  TITLE

  DESCRIPTION = <<-DESCRIPTION
---------------------------------------------------------------------------------------------------------------
For as long as you can remember, you've been living on the streets, you were raised with the beggars and common
thugs, as soon as you could walk you were made to earn your keep, beg here, pickpocket there, there's plenty of
unaware fools with full pockets weighing them down, and you were doing them a service by reducing their burden.
As you grew up, you got good at it, and the [Thieves Guild] decided to take you under their wing. With them you
prospered, the money was good, the risks were low, until now.

Your current mission is to rob the manor of the [Baron] living in the middle of the town. Gold is nice, but
it's the jewels you're after, specifically [The Family Heirloom], it is worth a fortune and light as a feather,
the perfect souvenir.

When the sun goes down your work begins. You move around the water canal and climb the fence into the
[Courtyard], avoiding the guards. The night is yours.
---------------------------------------------------------------------------------------------------------------
  DESCRIPTION

  def self.intro()
    puts TITLE
    puts DESCRIPTION
  end
end