require "spec_helper"
require_relative '../../lib/flee_action'


describe FleeAction do

  let(:hero) { double("hero", strength: 3, stealth: 3, flee: nil, damage: nil) }
  let(:action) { FleeAction.new hero }
  let(:dicepool) { double("dicepool") }
  let(:monster) { double('monster', notice: 2, damage: 4, toughness: 2, kill: nil ) }

  it_behaves_like "actionable"
  it_behaves_like "action"

  it "has stealth as an attribute" do
    expect(action.attribute).to eq(:stealth)
  end

  it "has notice as an difficulty" do
    expect(action.difficulty).to eq(:notice)
  end
  describe 'effect' do

    before do
      allow(Dicepool).to receive(:new).and_return(dicepool)
      allow(dicepool).to receive(:skill_check) { true }
    end

    after do
      action.activate(monster)
    end

    context "success" do
      it "sends flee message to the owner" do
        expect(hero).to receive(:flee)
      end
    end

    context "failure" do
      it "deals damage to the owner" do
        allow(dicepool).to receive(:skill_check).and_return(false)
        expect(hero).to receive(:damage).with(monster.damage)
      end
    end
  end
end