#-----------------------------------------------------------------------------------------
#This is a choose-your-own-adventure game, resolving around the Game of Thrones TV Series
#If you have not seen all seven seasons of Game of Thrones, don't play this. 
#-----------------------------------------------------------------------------------------

require '/setup.rb'

# Cersei's initiation on King's Landing

class CerseiPlan < Scene

  def enter()
    puts "Welcome to King's Landing Cersei."
    puts "As ruler of Westeros you have a lot to do!"
    puts "Looks like things aren't going too well right now..."
    puts "Jon Snow is rallying men in the North."
    puts "Daenerys Targaryen is crossing the Narrow Sea with her army and dragons."
    puts "And The Night King and The Dead are approaching the Wall."
    puts "Who will you focus on first? Jon, Daenerys or The Night King?"
    
    focus = $stdin.gets.chomp
    
    if focus == "Jon" or "Jon Snow"
        puts "Sounds good! You will try to stop Jon's rebellion."
        return 'CerseivsJon'
        
    elsif focus == "Daenerys" or "Daenerys Targaryen"
        puts "Sounds good! You will try to destroy Dany's forces."
        return ''
        
    elsif focus == "The Night King"
        puts "Sounds good! You will try to stop The Dead from attacking the Wall."
        return ''
    
    end
  end
end

#Cersei's fight against Jon Snow

class CerseivsJon < Scene

  def enter()
    puts "You have two choices:"
    puts "You can directly attack Jon or wait to see his strategy."
    puts "Type 'attack' to attack, or 'wait' to wait."
    print "> "

    action = $stdin.gets.chomp

    if action == "attack"
      puts "You gather your forces and march them up North."
      puts "Many of your men die on the journey from the extreme cold."
      puts "By the time you get to Winterfell, most of your army is either dead of too weak to fight."
      puts "I'm not even going to bother telling you what the Northeners did to your remaining men."
      return 'death'

    elsif action == "wait"
      puts "Good choice!"
      puts "Your little birds bring you daily reports on Jon's doings."
      puts "It turns out he is having some trouble keeping all of the houses united."
      puts "You send messengers to each house, promising them riches and freedom."
      puts "House Umber and House Karstark join your cause."
      puts "You convince them to send a solider to murder Jon Snow in the night."
      puts "The following morning the Northerners find Jon Snow's head on a pike, along with a note."
      puts "The note demands the remaining rebels join Cersei or die."
      puts "One by one, the houses give in and pledge their loyalty."
      return 'CerseiPlan2'
    
    end
  end
end

# Cersei gets to plan her fight against a second opponent, after a first victory

class CerseiPlan2 < Scene

  def enter()
      puts "After a first victory, you are back at The Red Keep."
      puts "With Jon Snow dead, Daenerys Targaryen and The Night King are the only ones left."
      puts "Who will you battle next? Dany or The Night King?"
    
    action = $stdin.gets.chomp
    
    if action == "Dany"
      puts ""
      return ""
      
    elsif action == "The Night King"
      puts ""
      return 'death'
    
   
   
    end
  end
end

class Finished < Scene
  def enter()
    puts "You did it! Good job conqueror!"
  end
end

class Map
  @@scenes = {
    'CharacterSetup' => CharacterSetup.new(),
    'CerseiPlan' => CerseiPlan.new(),
    'CerseivsJon' => CerseivsJon.new(),
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

a_map = Map.new('CharacterSetup')
a_game = Engine.new(a_map)
a_game.play()
