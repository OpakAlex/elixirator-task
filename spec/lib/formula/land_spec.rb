describe ElixiratorTask::Formula::Land do
  describe "#formula" do
    it "returns valud land value based on formula calculation" do
      expect(described_class.new(0,1).formula(1)).to eq((1 * 1 * 0.033 - 42).to_i)
    end
  end

  describe "#calculate" do
    it "returns fuel for land with 1.62 gravity" do
      value = described_class.new(1000, 1.62).calculate
      expect(value).to eq 11
    end

    it "returns fuel for land with 3.711 gravity" do
      value = described_class.new(1000, 3.711).calculate
      expect(value).to eq 80
    end

    it "returns fuel for land with 9.807 gravity" do
      value = described_class.new(1000, 9.807).calculate
      expect(value).to eq 329
    end
  end

  describe "#calculate_additional_fuel" do
    it "return addition fuel for 1000 fuel wuth 1.62 gravity" do
      value = described_class.new(1000, 1.62).calculate_additional_fuel(1000)
      expect(value).to eq 11
    end

    it "return addition fuel for 1000 fuel wuth 3.711 gravity" do
      value = described_class.new(1000, 3.711).calculate_additional_fuel(1000)
      expect(value).to eq 80
    end

    it "return addition fuel for 1000 fuel wuth 9.807 gravity" do
      value = described_class.new(1000, 9.807).calculate_additional_fuel(1000)
      expect(value).to eq 329
    end
  end

  describe "#needs_more_fuel?" do
    it "returns false if value less then constant" do
      expect(described_class.new(1, 1.62).needs_more_fuel?(39)).to eq false
    end

    it "returns false if value eq constant" do
      expect(described_class.new(1, 1.62).needs_more_fuel?(40)).to eq false
    end

    it "returns true if value more then constant" do
      expect(described_class.new(1, 1.62).needs_more_fuel?(41)).to eq true
    end
  end
end
