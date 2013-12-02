module RubyWarrior
  module Abilities
    class Melee < Base
      def description
        "Returns whether within melee range of an enemy"
      end
      
      def perform        
        spaces = []
        spaces << space(:forward).enemy?
        spaces << space(:backward).enemy?
        spaces << space(:left).enemy?
        spaces << space(:right).enemy?
        return spaces.any?
      end
    end
  end
end
