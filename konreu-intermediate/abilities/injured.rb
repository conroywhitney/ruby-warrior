module RubyWarrior
  module Abilities
    class Injured < Base
      def description
        "Returns whether we're too unhealthy to continue"
      end
      
      def perform
        return true if @unit.health <= (@unit.max_health / 2)
      end
    end
  end
end
