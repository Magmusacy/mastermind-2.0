require './lib/codemaker.rb'
require './lib/codebreaker.rb'
#require './lib/common_methods.rb'
describe Codemaker do
  describe "#create_code" do
    it "Generates code if codemaker is AI" do
      plr = Codemaker.new(:ai)
      p plr.code
      #expect(plr.code).to eql()
    end

    xit "Generates code if codemaker is Human" do
      plr = Codemaker.new(:human)
      p plr.code
    end
  end

  describe "#return_feedback" do
    it "Returns correct feedback when codecracker's guess contains dupes" do
      plr = Codemaker.new(:ai)
      plr.code = ["white", "white", "black", "black"]
      expect(plr.return_feedback(["white", "white", "white", "black"])).to eql({
        0 => "Correct color, correct position",
        1 => "Correct color, correct position",
        3 => "Correct color, correct position"
      })

    end

    it "Returns correct feedback when codecracker's guess contains dupes" do
      plr = Codemaker.new(:ai)
      plr.code = ["black","blue","yellow","white"]
      expect(plr.return_feedback(["green","yellow","yellow","purple"])).to eql({
        2 => "Correct color, correct position"
      })
    end

    xit "Returns correct feedback when codecracker's guess contains dupes" do
      plr = Codemaker.new(:ai)
      plr.code = ["white", "black", "white", "black"]
      expect(plr.return_feedback(["black", "white", "black", "white"])).to eql({
        0 => "Correct color, wrong position",
        1 => "Correct color, wrong position",
        2 => "Correct color, wrong position",
        3 => "Correct color, wrong position"
      })
    end
  end
end

describe Codebreaker do
  describe "#make_guess" do
    xit "Lets player take a guess" do
      plr = Codebreaker.new(:human)
      plr.make_guess
    end

    it "Lets computer take a guess" do
      codemaker = Codemaker.new(:ai)
      codemaker.code = ["orange","orange","orange","blue"]
      p codemaker
      plr = Codebreaker.new(:ai)
      p guess = ["green","red","purple","orange"]#plr.make_guess
      p feedback = codemaker.return_feedback(guess)
      p plr.make_guess(guess, feedback)
    end
  end
end