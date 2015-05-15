require "spec_helper"
require_relative '../../lib/hero'

describe Hero do
  let(:dicepool) { double('dicepool') }

  context "default attributes" do
    let(:hero) { Hero.new dicepool: dicepool }

    it "has default strength of 3" do
      expect(hero.strength).to eq(3)
    end
    it "has default health of 10" do
      expect(hero.health).to eq(10)
    end
  end

  context "custom attributes" do
    let(:hero) { Hero.new strength: 3, health: 15, dicepool: dicepool }

    it "can be initialized with custom strength" do
      expect(hero.strength).to eq(3)
    end
    it "can be initialized with custom health" do
      expect(hero.health).to eq(15)
    end

  end

  

  describe "attack" do

    it "succeeds" do
      dicepool.stub(:skill_check).and_return(3)
      hero = Hero.new dicepool: dicepool
      monster = double('monster', toughness: 2)
      expect(hero.attack(monster)).to be_truthy
    end

    it "fails" do
      dicepool.stub(:skill_check).and_return(1)
      hero = Hero.new dicepool: dicepool
      monster = double('monster', toughness: 2)
      expect(hero.attack(monster)).to be_falsy
    end

  end

end
