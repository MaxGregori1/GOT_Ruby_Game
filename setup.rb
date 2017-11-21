#Basic program functionality setup
class Scene
  def enter()
    puts "This scene has not been created. Subclass it and implement enter()."
    exit(1)
  end
end

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end

class Death < Scene

  @@death = [
    "You died.  No Iron Throne for you.",
     "Congrats you dead.",
     "Aaaaaaaaaaaaaand game over.",
     "Okay it really isn't that hard."
  ]

  def enter()
    puts @@death[rand(0..(@@death.length - 1))]
    exit(1)
  end
end

class CharacterSetup < Scene

  def enter()
    puts "Welcome to the Great Kingdoms of Westeros."
    puts "You have the choice of playing as one of four characters:"
    puts "Cersei Lannister, Jon Snow, Daenerys Targaryen or The Night King."
    puts "Please write out your desired character."
    print "> "

    character = $stdin.gets.chomp

    if character == "Cersei Lannister"
      puts "Interesing choice. You are now the queen of the Seven Kingdowns."
      puts "Try to survive as long as possible!"
      return 'Cersei_Plan'

    elsif character == "Jon Snow"
      puts "Solid choice. You are now the King in The North."
      puts "Try to survive as long as possible!"
      return 'death'

    elsif character == "Daenerys Targaryen"
      puts "A bold move. You are now the Mother of Dragons."
      puts "Try to survive as long as possible!"
      return 'laser_weapon_armory'
      
    elsif character == "The Night King"
      puts "Good one. You are now ruler of the dead."
      puts "Try to survive as long as possible!"
      return ''

    else
      puts "You must have spelled something incorrectly."
      puts "Give it another try!"
      return 'character_setup'
    end
  end
end