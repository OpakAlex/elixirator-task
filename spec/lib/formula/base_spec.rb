describe ElixiratorTask::Formula::Base do
  describe "MIN_FUEL_REQUIRES" do
    it "returns default contant value" do
      expect(described_class::MIN_FUEL_REQUIRES).to eq 40
    end
  end
end
