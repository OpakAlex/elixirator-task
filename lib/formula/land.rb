module ElixiratorTask
  module Formula
    class Land < Base
      def formula(value)
        (value * gravity * 0.033 - 42).to_i
      end
    end
  end
end
