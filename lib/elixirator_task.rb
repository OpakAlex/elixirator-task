require_relative './formula/base'
require_relative './formula/land'
require_relative './formula/launch'

module ElixiratorTask
  class FuelCalculator
    attr_reader :mass, :planets

    def initialize(mass, planets)
      @mass = mass
      @planets = planets
    end

    def call
      planets.inject(0) {|sum, planet| sum += calculate(mass + sum, planet[0], planet[1]) }
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
