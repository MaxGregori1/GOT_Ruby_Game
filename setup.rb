#-------------------------------------------------------------
#This a supplement to the "general.rb" file.
#The basic program and character setups can be found here.
#-------------------------------------------------------------

require './general.rb'

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('End')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end

class Introduction < Scene

  def enter()
    puts "Welcome to the Great Kingdoms of Westeros."
    puts "You are playing as Cersei Lannister, current queen of the Seven Kingdoms."
    puts "Your goal is to bring order to the Seven Kingdoms by conquering as much land as possible."
    puts "Please make sure that any and all commands you enter a fully lowercase."
    puts "Good luck!"
    return "CerseiPlan"
    
  end
end

class Map
  @@scenes = {
    'Introduction' => Introduction.new(),
    'CerseiPlan' => CerseiPlan.new(),
    'CerseivsJon' => CerseivsJon.new(),
    'CerseiPlan2' => CerseiPlan2.new(),
    'CerseivsDany' => CerseivsDany.new(),
    'CerseivsNightKing' => CerseivsNightKing.new(),
    'CerseiPlan3' => CerseiPlan3.new(),
    'End' => End.new()
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

a_map = Map.new('Introduction')
a_game = Engine.new(a_map)
a_game.play()
