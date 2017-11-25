require "rails_helper"

RSpec.describe Establishment, type: :model do
  describe ".valid?" do
    it "returns true when not errors" do
      establishment = create(:establishment)
      expect(establishment.valid?).to eq(true)
    end

    it "returns false when errors" do
      establishment = Establishment.new(name: "Barber")
      expect(establishment.valid?).to eq(false)
    end
  end
end
