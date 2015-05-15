require "spec_helper"
require_relative '../../lib/hero'

describe Hero do

  describe "default attributes" do
    let(:hero) { Hero.new }

    it "has default strength of 3" do
      expect(hero.strength).to eq(3)
    end

    it "has default health of 10" do
      expect(hero.health).to eq(10)
    end
  end

  it "can be initialized with custom strength" do
    hero = Hero.new strength: 3
    expect(hero.strength).to eq(3)
  end

  it "can be initialized with custom health" do
    hero = Hero.new health: 15
    expect(hero.health).to eq(15)
  end
  
end
