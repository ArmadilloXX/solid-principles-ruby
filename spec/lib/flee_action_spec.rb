require "spec_helper"
require_relative '../../lib/flee_action'


describe FleeAction do

  let(:hero) { double("hero", strength: 3, stealth: 3, flee: nil, damage: nil) }
  let(:action) { FleeAction.new hero, dicepool  }
  let(:dicepool) { double("dicepool") }
  let(:monster) { double('monster', notice: 2, damage: 4, toughness: 2, kill: nil ) }

  it_behaves_like "action"
  it_behaves_like "subaction"

  it "has stealth as an attribute" do
    expect(action.attribute).to eq(:stealth)
  end

  it "has notice as an difficulty" do
    expect(action.difficulty).to eq(:notice)
  end
  describe 'effect' do

    context "success" do
      it "sends flee message to the owner" do
        allow(dicepool).to receive(:skill_check).and_return(true)
        expect(hero).to receive(:flee)
        action.activate(monster)
      end
    end

    context "failure" do
      it "deals damage to the owner" do
        allow(dicepool).to receive(:skill_check).and_return(false)
        expect(hero).to receive(:damage).with(monster.damage)
        action.activate(monster)
      end
    end
  end
end