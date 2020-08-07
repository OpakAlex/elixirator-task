describe ElixiratorTask::FuelCalculator do
  describe "Apollo 11" do
    it "returns fuel value for mission" do
      missions = [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]
      expect(described_class.new(28801, missions).call).to eq 51898
    end
  end

  describe "MissiononMars" do
    it "returns fuel value for mission" do
      missions = [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]
      expect(described_class.new(14606, missions).call).to eq 33388
    end
  end

  describe "Passenger ship" do
    it "returns fuel value for mission" do
      missions = [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711],
                  [:launch, 3.711], [:land, 9.807]]
      expect(described_class.new(75432, missions).call).to eq 212161
    end
  end
end
