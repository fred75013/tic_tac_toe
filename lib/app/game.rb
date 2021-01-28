class Game 
  attr_accessor :player_1, :player_2

  def initialize
    system('clear')
    puts " ========================= WELCOME ========================= ".light_blue.bold
    puts "|                                                           |".light_blue.bold
    puts "|                   T I C ░ T A C ░ T O E                   |".light_red.swap
    puts "|                                                           |".light_blue.bold
    puts "|               by Fred, Melvin, Théo & Kevin               |".light_blue
    puts "|              ƪ(˘⌣˘)┐ ƪ(˘⌣˘)ʃ ┌(˘⌣˘)ʃ ┌(˘⌣˘)ʃ              |".light_blue
    puts " =========================================================== ".light_blue.bold
    puts "" #espace 
    puts "                 Quel est ton nom mousaillon ?".yellow.bold
    puts ""
    name = gets.chomp
    @player_1 = Player.new(name, "╳".red.bold)
    puts "             Salut #{player_1.name}, tu commenceras avec les  #{player_1.symbol}".bold
    puts ""
    puts "              Quel est le nom de ton adversaire ?".yellow.bold
    name = gets.chomp
    @player_2 = Player.new(name, "◌".green.bold)
    puts "               Yo #{player_2.name}, tu seras donc les #{player_2.symbol}".bold
    puts ""
    puts "                     Press #{"ENTER".red} to start".bold
    gets.chomp
    system('clear')
 
  end

  def one_game
    myboard = nil
    myboard = Board.new
    myboard.show_board
    
    i = 1
    while i < 9
      myboard.play(player_1)
      myboard.show_board
      i += 1
      if myboard.player_win(player_1.symbol) == true
        puts "🌟 YOUUUUUUHOUU ! AND THE #{"WINNER".green.bold} IS #{player_1.name} 🌈 "
        puts "💀 #{player_2.name} #{"LOOSE".red.bold} 💀"
      end
      break if myboard.player_win(player_1.symbol) == true
    
      myboard.play(player_2)
      myboard.show_board
      i += 1
      if myboard.player_win(player_2.symbol) == true
        puts "🌟 ALLEZ LAAA ! AND THE #{"WINNER".green.bold} IS #{player_2.name} 🌈 "
        puts "💀 #{player_1.name} #{"LOOSE".red.bold} 💀"
      end
      break if myboard.player_win(player_2.symbol) == true
    end
    
    if myboard.player_win(player_2.symbol) == false && myboard.player_win(player_1.symbol) == false
      puts "match nul my friend !"
    end
    new_round
  end

  def new_round
    puts""
    puts "         on se relance une game ? (#{"YES".green} or #{"NO".red})".bold
    question = gets.chomp.downcase

    while question != "yes" && question != "no"
      puts "   ⛔️  ecris #{"YES".green}  ou #{"NO".red} stp  ⛔️".bold
      question = gets.chomp.downcase
    end

    if question == "yes"
      puts "    🎉 Let's GO ".bold.yellow
      one_game
    else
      puts "à la prochaine my friend 😘 ".bold.yellow
    end
  end

end