require 'spec_helper'

describe RubyWarrior::Abilities::Melee do
  before(:each) do
    @floor = RubyWarrior::Floor.new
    @floor.width = 3
    @floor.height = 3
    
    @warrior = RubyWarrior::Units::Warrior.new
  
    @melee = RubyWarrior::Abilities::Melee.new(@warrior)
  end
  
  it "should be in melee range if enemy is forward" do
    @floor.add(@warrior, 1, 1)
    @floor.add(RubyWarrior::Units::Sludge.new, 0, 1)
    @melee.perform.should be_true
  end
  
  it "should be in melee range if enemy is backward" do
    @floor.add(@warrior, 1, 1)
    @floor.add(RubyWarrior::Units::Sludge.new, 1, 0)
    @melee.perform.should be_true
  end
  
  it "should be in melee range if enemy is left" do
    @floor.add(@warrior, 1, 1)
    @floor.add(RubyWarrior::Units::Sludge.new, 1, 2)
    @melee.perform.should be_true
  end
  
  it "should be in melee range if enemy is right" do
    @floor.add(@warrior, 1, 1)
    @floor.add(RubyWarrior::Units::Sludge.new, 2, 1)
    @melee.perform.should be_true
  end
  
  it "should NOT sense danger if diagonals" do
    @floor.add(@warrior, 1, 1)
    @floor.add(RubyWarrior::Units::Sludge.new, 0, 0)
    @floor.add(RubyWarrior::Units::Sludge.new, 0, 2)
    @floor.add(RubyWarrior::Units::Sludge.new, 2, 0)
    @floor.add(RubyWarrior::Units::Sludge.new, 2, 2)
    @melee.perform.should be_false
  end
  
end
