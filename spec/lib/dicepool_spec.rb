require "spec_helper"
require_relative '../../lib/dicepool'

describe Dicepool do
  let(:dicepool) { Dicepool.new }
  
  describe 'skill_check' do

    it "returns true if successes count more than difficulty" do
      allow(dicepool).to receive(:roll_die).and_return(5)
      expect(dicepool.skill_check(3, 2)).to be_truthy
    end

    it "returns false if successes count less than difficulty" do
      allow(dicepool).to receive(:roll_die).and_return(3)
      expect(dicepool.skill_check(3, 2)).to be_falsy
    end
  end

end