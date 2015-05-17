require 'spec_helper'

require_relative '../../lib/hero'
require_relative '../../lib/monster'
require_relative '../../lib/attack_action'
require_relative '../../lib/flee_action'
require_relative '../../lib/dicepool'

describe "Battle" do

  let(:monster) { Monster.new toughness: 2,
                              notice: 1,
                              damage: 4,
                              exp: 10,
                              gold: 20
                }
  let(:hero) { Hero.new strength: 5,
                        health: 10,
                        actions: {
                          attack: AttackAction.new,
                          flee: FleeAction.new
                        }
              }
  let(:dicepool) { Dicepool.new }
  
  describe "Hero attack monster" do
    
    context "successful attack" do
      before do
        allow(dicepool).to receive(:roll_die).and_return(5)
        allow(Dicepool).to receive(:new).and_return(dicepool)
        hero.activate_action :attack, monster
      end

      it 'kills monster' do
        expect(monster).to be_dead
      end
      it 'gets gold from monster' do
        expect(hero.gold).to eq(monster.gold)
      end
      it 'gets experience from monster' do
        expect(hero.exp).to eq(monster.exp)
      end
    end

    context "attack failed" do
      before do
        allow(dicepool).to receive(:roll_die).and_return(1)
        allow(Dicepool).to receive(:new).and_return(dicepool)
        hero.activate_action :attack, monster
      end

      it 'takes damage and decreases health of hero' do
        expect(hero.health).to eq(6)
      end
    end
  end

  describe "Hero flees from monster" do
    
    context "Flee attempt successful" do
      before do
        allow(dicepool).to receive(:roll_die).and_return(5)
        allow(Dicepool).to receive(:new).and_return(dicepool)
        hero.activate_action :flee, monster
      end
      it 'fled' do
        expect(hero.fled?).to eq(true)
      end
    end

    context "Flee attempt failed" do
      before do
        allow(dicepool).to receive(:roll_die).and_return(1)
        allow(Dicepool).to receive(:new).and_return(dicepool)
        hero.activate_action :flee, monster
      end
      it 'takes damage' do
        expect(hero.health).to eq(6)
      end
    end
  end
end