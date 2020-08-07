module ElixiratorTask
  module Formula
    class Base

      attr_reader :mass, :gravity

      MIN_FUEL_REQUIRES = 40

      def initialize(mass, gravity)
        @mass = mass
        @gravity = gravity
      end

      def calculate
        fuel = formula(mass)
        additional_fuel = calculate_additional_fuel(fuel)
        fuel + additional_fuel
      end

      def calculate_additional_fuel(fuel, sum = 0)
        return sum unless needs_more_fuel?(fuel)
        additional_fuel = formula(fuel)
        calculate_additional_fuel(additional_fuel, sum + additional_fuel)
      end

      def needs_more_fuel?(value)
        value > MIN_FUEL_REQUIRES
      end
    end
  end
end
