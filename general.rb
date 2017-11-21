#This is a choose-your-own-adventure game, resolving around the Game of Thrones TV Series
#__________________________________________________________________________________________

#General program setup
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
    puts "Cersei Lannister, Jon Snow, Daenerys Targaryen or The Ice King."
    puts "Please write out your desired character."
    print "> "

    character = $stdin.gets.chomp

    if character == "shoot!"
      puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
      return 'death'

    elsif character == "dodge!"
      puts "Like a world class boxer you dodge, weave, slip and slide right"
      return 'death'

    elsif character == "tell a joke"
      puts "Lucky for you they made you learn Gothon insults in the academy."
      return 'laser_weapon_armory'
      
    elsif character == "The Ice King"
      puts ""

    else
      puts "DOES NOT COMPUTE!"
      return 'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
    puts "for more Gothons that might be hiding.  It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find the"
    puts "neutron bomb in its container.  There's a keypad lock on the box"
    puts "and you need the code to get the bomb out.  If you get the code"
    puts "wrong 10 times then the lock closes forever and you can't"
    puts "get the bomb.  The code is 3 digits."
    code = "#{rand(1..1)}#{rand(1..1)}#{rand(1..1)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 15
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
        puts "The container clicks open and the seal breaks, letting gas out."
        puts "You grab the neutron bomb and run as fast as you can to the"
        puts "bridge where you must place it in the right spot."
        return 'the_bridge'
    else
        puts "The lock buzzes one last time and then you hear a sickening"
        puts "melting sound as the mechanism is fused together."
        puts "You decide to sit there, and finally the Gothons blow up the"
        puts "ship from their ship and you die."
        return 'death'
    end
  end
end


class TheBridge < Scene

  def enter()
    puts "You burst onto the Bridge with the netron destruct bomb"
    puts "under your arm and surprise 5 Gothons who are trying to"
    puts "take control of the ship.  Each of them has an even uglier"
    puts "clown costume than the last.  They haven't pulled their"
    puts "weapons out yet, as they see the active bomb under your"
    puts "arm and don't want to set it off."
    print "> "

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts "In a panic you throw the bomb at the group of Gothons"
      puts "and make a leap for the door.  Right as you drop it a"
      puts "Gothon shoots you right in the back killing you."
      puts "As you die you see another Gothon frantically try to disarm"
      puts "the bomb. You die knowing they will probably blow up when"
      puts "it goes off."
      return 'death'

    elsif action == "slowly place the bomb"
      puts "You point your blaster at the bomb under your arm"
      puts "and the Gothons put their hands up and start to sweat."
      puts "You inch backward to the door, open it, and then carefully"
      puts "place the bomb on the floor, pointing your blaster at it."
      puts "You then jump back through the door, punch the close button"
      puts "and blast the lock so the Gothons can't get out."
      puts "Now that the bomb is placed you run to the escape pod to"
      puts "get off this tin can."
      return 'escape_pod'
    else
      puts "DOES NOT COMPUTE!"
      return "the_bridge"
    end
  end
end


class EscapePod < Scene

  def enter()
    puts "You rush through the ship desperately trying to make it to"
    puts "the escape pod before the whole ship explodes.  It seems like"
    puts "hardly any Gothons are on the ship, so your run is clear of"
    puts "interference.  You get to the chamber with the escape pods, and"
    puts "now need to pick one to take.  Some of them could be damaged"
    puts "but you don't have time to look.  There's 5 pods, which one"
    puts "do you take?"

    good_pod = rand(1..1)
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod escapes out into the void of space, then"
      puts "implodes as the hull ruptures, crushing your body"
      puts "into jam jelly."
      return 'death'
    else
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod easily slides out into space heading to"
      puts "the planet below.  As it flies to the planet, you look"
      puts "back and see your ship implode then explode like a"
      puts "bright star, taking out the Gothon ship at the same"
      puts "time.  You won!"


      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map
  @@scenes = {
    'character-setup' => CharacterSetup.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
  }


  def initialize(start_scene)
    @start_scene = start_scene
  end


  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
