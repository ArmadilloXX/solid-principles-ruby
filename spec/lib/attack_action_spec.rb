require "spec_helper"
require_relative '../../lib/attack_action'

describe AttackAction do

  let(:hero) { double("hero", strength: 3) }
  let(:action) { AttackAction.new hero, dicepool  }
  let(:dicepool) { double("dicepool") }


  describe 'activate' do
    let(:monster) { double('monster', toughness: 2) }

    it "makes strength check against target toughness" do
      expect(dicepool).to receive(:skill_check).with(hero.strength, monster.toughness)
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