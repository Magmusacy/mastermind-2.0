require_relative 'common_methods.rb'

class Codemaker
  include CommonMethods

  attr_accessor :player_type, :code
  
  def initialize(player_type = :ai)
    @player_type = player_type
    @code = create_code(self)
  end

  def return_feedback(guess)
    return_hash = {}
    colors_awarded = []
    guess.each_with_index do |color, idx| 
      if code[idx] == color 
        return_hash[idx] = COLOR_AND_INDEX
        colors_awarded << color unless colors_awarded.include?(color)
      end
    end 
    guess.each_with_index do |color, idx|
      if code.include?(color) && !colors_awarded.include?(color)
        return_hash[idx] = COLOR_ONLY
        colors_awarded << color unless colors_awarded.include?(color)
      end
    end
    return_hash
  end
end