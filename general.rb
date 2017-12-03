#--------------------------------------------------------------------------------------------
#This is a choose-your-own-adventure game, resolving around the Game of Thrones TV Series
#If you have not seen all seven seasons of Game of Thrones, don't play this. 
#--------------------------------------------------------------------------------------------

# Cersei's initiation on King's Landing

class Scene
  def enter()
    puts "This scene has not been created. Subclass it and implement enter()."
    exit(1)
  end
end

class CerseiPlan < Scene

  def enter()
    puts "Welcome to King's Landing Cersei."
    puts "As ruler of Westeros you have a lot to do!"
    puts "Looks like things aren't going too well right now..."
    puts "Jon Snow is rallying men in the North."
    puts "Daenerys Targaryen is crossing the Narrow Sea with her army and dragons."
    puts "And The Night King and The Dead are approaching the Wall."
    puts "Who will you focus on first? Jon, Daenerys or The Night King?"
    puts ">>> "
    
    focus = $stdin.gets.chomp
    
    if focus == "jon"
        puts "Sounds good! You will try to stop Jon's rebellion."
        return 'CerseivsJon'
        
    elsif focus == "daenerys"
        puts "Sounds good! You will try to destroy Dany's forces."
        return 'CerseivsDany'
        
    elsif focus == "the night king"
        puts "Sounds good! You will try to stop The Dead from attacking the Wall."
        return 'CerseivsNightKing'
        
    end
  end  
end


#Cersei's fight against Jon Snow

class CerseivsJon < Scene

  def enter()
    puts "You have two choices:"
    puts "You can directly attack Jon or wait to see his strategy."
    puts "Type 'attack' to attack, or 'wait' to wait."
    print ">>> "

    action = $stdin.gets.chomp

    if action == "attack"
      puts "You gather your forces and march them up North."
      puts "Many of your men die on the journey from the extreme cold."
      puts "By the time you get to Winterfell, most of your army is either dead of too weak to fight."
      puts "I'm not even going to bother telling you what the Northeners did to your remaining men."
      return 'CerseivsJon'

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
      puts ">>> "
    
    action = $stdin.gets.chomp
    
    if action == "dany"
      puts "A bold move, The Mother of Dragons."
      puts "Dany and her army have landed at Dragonstone."
      puts "Whatever you do, beware of her dragons."
      return 'CerseivsDany'
      
    elsif action == "the night king"
      puts "A bold move, The Night King."
      puts "With your new troops already in the North, you are very close to The Wall."
      puts "The only way to reach The Dead is by venturing beyond it."
      return 'CerseivsNightKing'

    end
  end
end

class CerseivsDany < Scene
  
  def enter()
    puts "There are two ways you can go about attacking Dany."
    puts "You can lay siege to Dragonstone or attack the castle from the sea."
    puts "What will it be? Siege or attack?"
    
  action = $stdin.gets.chomp
  
    if action == "siege"
      puts "You have chosen to lay siege to Dragonstone."
      puts "You have Jamie march the Lannister army to the castle."
      puts "The men set up tents and siege weapons."
      puts "As night approaches, you hear a piercing screeching noise."
      puts "The camp falls quiet for a few erie seconds."
      puts "Then the sky gets lit on fire."
      puts "Three full-grown dragons appear from behind the castle walls."
      puts "They burn dowmn your camp, weapons and soliders."
      puts "As morning approaches, the only thing left are black columns of smoke rising into the sky."
      puts "Maybe it's just impossible to defeat a three dragons in battle."
      return "End"
      
    elsif action == "attack" 
      puts "You have chosen to attack Dragonstone from the sea."
      puts "The Ironborn Fleet sets course for the castle."
      puts "As the castle walls appear on the horizon, you hear a piercing screech."
      puts "Three full-grown dragons barrel from the sky towards your ships."
      puts "In a helpless struggle, your soldiers stand frozen in awe."
      puts "One by one, the dragons burn down the ships."
      puts "As morning approaches, the only thing left are black columns of smoke rising into the sky."
      puts "Maybe it's just impossible to defeat three dragons in battle."
      return "End"
      
    end
  end
end

class CerseivsNightKing < Scene
  
  def enter()
    puts "You assemble your northern troops for battle."
    puts "There are two ways you can go about this:"
    puts "You can march through the gates in the wall, or plan a defensive setup."
    puts "So, what will it be? Attack or defend?"
    puts ">>> "
    
  action = $stdin.gets.chomp
    
    if action == "attack"
      puts "You have chosen to attack the Night King and his forces."
      puts "Row by row, your troops march through the wall at Castle Black."
      puts "As your men venture even further North, night falls upon them."
      puts "It's quite obvious that the White Walkers will only attack in the dark."
      puts "Thus you make the majority of your men stand guard through the night."
      puts "Many of your men grow tired, and are unwillign to walk come morning."
      puts "Several soliders start abandoning your cause, because they believe that they can't win."
      puts "Ever so slowly, anarchy breaks out among the ranks and your army is divided."
      puts "Come night again, your soldiers turn to easy meat for the horde of dead which have been watching you since the beginning."
      return "End"
      
    elsif action == "defend"
      puts "You have chosen to establish a strong defensive at the wall."
      puts "You spread out your forces among the various castles."
      puts "One by one, the unmanned castles are transformed into Lannister guard posts."
      puts "You transport all sorts of heavy machinery on top of the wall"
      puts "By nighttime, one of the watchmen sees the slowly approaching horde of dead."
      puts "At the very front is their leader, The Night King."
      puts "Your men assume their battle stations."
      puts "As thousands of flaming arrows and barrels fill in the sky, the dying screech of the Dead can be heard from the top."
      puts "For what seems like an endless period of time, your soliders ligth up the army over and over again."
      puts "At the crack of dawn, you make your way on top of the wall and find the northern forest alight with balzing fire."
      puts "You look down into the courtyard of Castle Black, where you smile at the black corpse of the Night King."
      puts "Congratulations! You defeated the Dead!"
      return "CerseiPlan3"
      
    end
  end 
end

class CerseiPlan3 < Scene
  
  def enter()
    puts "The only enemty left now is Dany and her allies."
    puts "Together, they have managed to land at Dragonstone."
    return "CerseivsDany"
    
  end 
end

class End < Scene
  
  def enter()
    puts "This is the end for you."
    puts "You did the best you could!"
    puts "Congratulations on your victories conqueror!"
    puts "Feel free to restart the game, or close the window if you're done playing."

  end
end

