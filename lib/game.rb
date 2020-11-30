require_relative 'codemaker.rb'
require_relative 'codebreaker.rb'


def play
  puts "MASTERMIND"
  puts "Choose your players: \nNOTE: player chosen first is always codemaker, while second player is always codebreaker"
  choice = nil
  until [1,2,3,4].include?(choice)
    puts "\n1: human vs human\n2: human vs ai\n3: ai vs human\n4: ai vs ai"
    choice = gets.to_i
  end

  case choice
  when 1 then player1 = Codemaker.new(:human); player2 = Codebreaker.new(:human)
  when 2 then player1 = Codemaker.new(:human); player2 = Codebreaker.new
  when 3 then player1 = Codemaker.new; player2 = Codebreaker.new(:human)
  when 4 then player1 = Codemaker.new; player2 = Codebreaker.new
  end
  feedback = {} # this is default value
  prev_guess = nil
  12.times do |i|
    guess = player2.player_type == :ai ? player2.make_guess(prev_guess, feedback) : player2.make_guess
    prev_guess = guess
    feedback = player1.return_feedback(guess)
    p player1.code
    puts "Codecracker's guess: #{guess}"
    feedback.values.each{ |val| puts "*#{val}*" }
    return puts("Codecracker won in #{i} tries") if feedback.values.count(CommonMethods::COLOR_AND_INDEX) == 4
  end
  puts "Codemaker won his secret code: #{player1.code}"
end

play