require "rails_helper"

RSpec.describe Service, type: :model do
  describe ".valid?" do
    it "returns true when not errors" do
      service = create(:service)
      expect(service.valid?).to eq(true)
    end

    it "returns false when errors" do
      service = Service.new(name: "Peluqueria")
      expect(service.valid?).to eq(false)
    end
  end
end
