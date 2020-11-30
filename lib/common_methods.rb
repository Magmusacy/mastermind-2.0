module CommonMethods

  COLORS = %w[red green yellow orange blue pink purple black white brown]
  COLOR_AND_INDEX = "Correct color, correct position"
  COLOR_ONLY = "Correct color, wrong position"

  def create_code(player)
    return Array.new(4){ COLORS.sample } if player.player_type == :ai # COLORS.sample for each array element to make it possible for numbers to repeath themselves which is not the case if we simply use .sample
    player.is_a?(Codemaker) ? (puts "\nPick a color code for codebreaker") : (puts "\nTry to break the code")
    puts "Available COLORS are:\n|#{COLORS.join("|")}|"
    puts "To pick desired COLORS, type them into terminal with - as a separation sign"
    puts "example: white-blue-red-white\n"
    choice = gets.chomp.split("-")
    return create_code(player) unless choice.all?{ |color| COLORS.include?(color) } && choice.length == 4   
    choice
  end

end