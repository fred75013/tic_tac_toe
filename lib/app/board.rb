class Board
  attr_accessor :A1, :A2, :A3, :B1, :B2, :B3, :C1, :C2, :C3

  def initialize
    @A1 = BoardCase.new("a1", " ")
    @A2 = BoardCase.new("a2", " ")
    @A3 = BoardCase.new("a3", " ")
    @B1 = BoardCase.new("b1", " ")
    @B2 = BoardCase.new("b2", " ")
    @B3 = BoardCase.new("b3", " ")
    @C1 = BoardCase.new("c1", " ")
    @C2 = BoardCase.new("c2", " ")
    @C3 = BoardCase.new("c3", " ")
  end
    
  def play (player)
    puts ""
    puts "     #{player.name.red.bold}, a toi de jouer ! Où veux-tu te placer ? "
    choice = gets.chomp
    while choice != "a1" && choice != "a2" && choice != "a3" && choice != "b1" && choice != "b2" && choice != "b3" && choice != "c1" && choice != "c2" && choice != "c3"
      puts "❌ Je m'y attendais ⛔️ Ecris au bon format genre a1, a2 ou autres stp ❌"
      choice = gets.chomp
    end
    system('clear')

    case choice
    when "a1" 
      @A1.content = player.symbol if @A1.content == " "
    when "a2"
      @A2.content = player.symbol if @A2.content == " "
    when "a3"
      @A3.content = player.symbol if @A3.content == " "
    when "b1"
      @B1.content = player.symbol if @B1.content == " "
    when "b2"
      @B2.content = player.symbol if @B2.content == " "
    when "b3"
      @B3.content = player.symbol if @B3.content == " "
    when "c1"
      @C1.content = player.symbol if @C1.content == " "
    when "c2"
      @C2.content = player.symbol if @C2.content == " "
    when "c3"
      @C3.content = player.symbol if @C3.content == " "
    end
  end

  def show_board
    puts"           A              B             C        ".yellow.bold
    puts"                   |             |               "
    puts"                   |             |               "
    puts" #{'1'.yellow.bold}         #{@A1.content}       |      #{@B1.content}      |      #{@C1.content}"
    puts"                   |             |               "
    puts"                   |             |               "
    puts"      -----------------------------------------  "
    puts"                   |             |               "
    puts"                   |             |               "
    puts" #{'2'.yellow.bold}         #{@A2.content}       |      #{@B2.content}      |      #{@C2.content}"
    puts"                   |             |               "
    puts"                   |             |               "
    puts"      -----------------------------------------  "
    puts"                   |             |               "
    puts"                   |             |               "
    puts" #{'3'.yellow.bold}         #{@A3.content}       |      #{@B3.content}      |      #{@C3.content}"
    puts"                   |             |               "
    puts"                   |             |               "
  end

  def player_win(player_symbol)
    if (@A1.content == player_symbol && @A2.content == player_symbol && @A3.content == player_symbol) || (@B1.content == player_symbol && @B2.content == player_symbol && @B3.content == player_symbol) || (@C1.content == player_symbol && @C2.content == player_symbol && @C3.content == player_symbol) || (@A1.content == player_symbol && @B1.content == player_symbol && @C1.content == player_symbol) || (@A2.content == player_symbol && @B2.content == player_symbol && @C2.content == player_symbol) || (@A3.content == player_symbol && @B3.content == player_symbol && @C3.content == player_symbol) || (@A1.content == player_symbol && @B2.content == player_symbol && @C3.content == player_symbol) || (@A3.content == player_symbol && @B2.content == player_symbol && @C1.content == player_symbol)
      return true
    else
      return false
    end
  end

end
