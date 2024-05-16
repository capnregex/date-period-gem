# frozen_string_literal: true

RSpec.describe Date::Period do
  it "has a version number" do
    expect(Date::Period::VERSION).not_to be nil
  end

  describe "Date" do
    let(:sunday) { Date.new(2024,5,12) }
    let(:wednesday) { Date.new(2024,5,15) }

    it "includes active support foo" do
      expect(wednesday.beginning_of_week(:sunday)).to eq(sunday)
    end
  end
end
