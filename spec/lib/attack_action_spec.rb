require "spec_helper"
require_relative '../../lib/attack_action'

describe AttackAction do

  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil ) }
  let(:action) { AttackAction.new hero }
  let(:dicepool) { double("dicepool") }
  let(:monster) { double('monster', damage: 4, toughness: 2, kill: nil, exp: 10, gold: 10 ) }

  it_behaves_like "actionable"
  it_behaves_like "action"

  it "has strength as an attribute" do
    expect(action.attribute).to eq(:strength)
  end

  it "has toughness as an difficulty" do
    expect(action.difficulty).to eq(:toughness)
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

      it 'kills monster' do
        expect(monster).to receive(:kill)
      end
      it 'rewards owner with exp' do
        expect(hero).to receive(:gain_exp)
      end
      it 'rewards owner with gold' do
        expect(hero).to receive(:gain_gold)
      end
    end

    context "failure" do
      it 'damages owner' do
        allow(dicepool).to receive(:skill_check) { false }
        expect(hero).to receive(:damage).with(monster.damage)
      end
    end
  end
end