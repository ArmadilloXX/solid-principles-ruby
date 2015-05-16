require "spec_helper"
require_relative '../../lib/hero'

describe Hero do

  context "default attributes" do
    let(:hero) { Hero.new }

    it "has default strength of 3" do
      expect(hero.strength).to eq(3)
    end
    
    it "has default health of 10" do
      expect(hero.health).to eq(10)
    end

  end

  context "custom attributes" do
    let(:hero) { Hero.new strength: 3, health: 15 }

    it "can be initialized with custom strength" do
      expect(hero.strength).to eq(3)
    end

    it "can be initialized with custom health" do
      expect(hero.health).to eq(15)
    end

  end

  describe "attack" do
    let(:attack_action) { double('attack_action') }
    let(:hero) { Hero.new actions: {attack: attack_action} } 

    it "has attack action" do
      expect(hero.actions[:attack]).to eq(attack_action)
    end

    it "activates attack action" do
      monster = double('monster')
      expect(attack_action).to receive(:activate)
      hero.activate_action :attack, monster
    end

  end
end
