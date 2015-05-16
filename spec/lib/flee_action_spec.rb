require "spec_helper"
require_relative '../../lib/flee_action'

describe FleeAction do

  let(:hero) { double("hero", strength: 3, stealth: 3 ) }
  let(:action) { FleeAction.new hero, dicepool  }
  let(:dicepool) { double("dicepool") }
  let(:monster) { double('monster', notice: 2, damage: 4, toughness: 2, kill: nil ) }

  describe 'effect' do
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