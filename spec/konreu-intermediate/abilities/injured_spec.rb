require 'spec_helper'

describe RubyWarrior::Abilities::Injured do
  before(:each) do
    @warrior = RubyWarrior::Units::Warrior.new
    @injured = RubyWarrior::Abilities::Injured.new(@warrior)
  end
  
  it "should be injured if dips below threshold" do
    @warrior.health = (@warrior.max_health / 2)
    @injured.perform.should be_true
  end
  
  it "should NOT be injured if healthy" do
    @warrior.health = (@warrior.max_health / 2) + 1
    @injured.perform.should be_false
  end
  
end
