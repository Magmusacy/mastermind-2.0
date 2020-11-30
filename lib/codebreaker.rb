require_relative 'common_methods.rb'

class Codebreaker
  include CommonMethods
  
  attr_reader :player_type 

  def initialize(player_type = :ai)
    @player_type = player_type
  end

  def make_guess(prev_guess=nil, optional_feedback = {})
    if player_type == :ai
      new_code = create_code(self) 
      available_indexes = [0,1,2,3]
      optional_feedback.keys.each do |key|
        if optional_feedback[key] == COLOR_AND_INDEX
          new_code[key] = prev_guess[key]
          available_indexes.delete(key)
        elsif optional_feedback[key] = COLOR_ONLY
          index = available_indexes - [key]
          new_code[index.sample] = prev_guess[key]
        end
      end
      new_code
    else
      create_code(self)
    end
  end
end