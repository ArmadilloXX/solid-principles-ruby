require "spec_helper"
require_relative '../../lib/flee_action'


describe FleeAction do

  let(:hero) { double("hero", strength: 3, stealth: 3, flee: nil, damage: nil) }
  let(:action) { FleeAction.new hero, dicepool  }
  let(:dicepool) { double("dicepool") }
  let(:monster) { double('monster', notice: 2, damage: 4, toughness: 2, kill: nil ) }

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


  describe 'activate' do

    it "makes stealth check against target notice" do
      expect(dicepool).to receive(:skill_check).with(hero.stealth, monster.notice)
      action.activate(monster)
    end
  end
  
  it "responds to activate message" do
    expect(action).to respond_to(:activate)
  end

  it 'has an owner' do 
    expect(action.owner).to eq(hero)
  end


end