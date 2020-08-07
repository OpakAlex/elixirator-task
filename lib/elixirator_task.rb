require_relative './formula/base'
require_relative './formula/land'
require_relative './formula/launch'

module ElixiratorTask
  class FuelCalculator
    attr_reader :mass, :missions

    def initialize(mass, missions)
      @mass = mass
      @missions = missions
    end

    def call
      missions.inject(0) {|sum, mission| sum += calculate(mass + sum, mission[0], mission[1]) }
    end

    private

    def calculate(mass, operation, gravity)
      formula_class(operation).new(mass, gravity).calculate
    end

    def formula_class(operation)
      case operation
      when :launch
        Formula::Launch
      when :land
        Formula::Land
      else
        raise "Unknown operation!"
      end
    end
  end
end
