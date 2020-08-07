module ElixiratorTask
  module Formula
    class Launch < Base
      def formula(value)
        (value * gravity * 0.042 - 33).to_i
      end
    end
  end
end
