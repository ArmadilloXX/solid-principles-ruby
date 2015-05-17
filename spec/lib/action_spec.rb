require "spec_helper"
require_relative '../../lib/action'

class TestAction 
  include Actionable
  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
  end
end

describe Actionable do

  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil ) }
  let(:action) { TestAction.new hero }
  let(:dicepool) { double("dicepool") }
  let(:monster) { double('monster', damage: 4, toughness: 2, kill: nil ) }

  it_behaves_like "action"

  # HOW IT WORKS AFTER SWITCH TO MIXINS INHERITANCE???

  it "requires action attributes to be implemented" do
    expect { Action.new hero }.to raise_exception
  end

  describe 'activate' do

    before do
      allow(Dicepool).to receive(:new).and_return(dicepool)
    end

    it "sends success message if skill check is successful" do
      allow(dicepool).to receive(:skill_check) { true }
      expect(action).to receive(:success)
      action.activate(monster)
    end

    it "sends failure message if skill check is failed" do
      allow(dicepool).to receive(:skill_check) { false }
      expect(action).to receive(:failure)
      action.activate(monster)
    end
  end

end