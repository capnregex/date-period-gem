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
RSpec.describe Date::Period do
  describe "#find" do
    it { expect(Date::Period.find(nil)).to eq(Date::Period::Month) }
    it { expect(Date::Period.find("foo")).to eq(Date::Period::Month) }
    it { expect(Date::Period.find("week")).to eq(Date::Period::Week) }
    it { expect(Date::Period.find("pay_period")).to eq(Date::Period::PayPeriod) }
    it { expect(Date::Period.find("month")).to eq(Date::Period::Month) }
    it { expect(Date::Period.find("quarter")).to eq(Date::Period::Quarter) }
    it { expect(Date::Period.find("year")).to eq(Date::Period::Year) }
  end

  describe "#new" do
    let(:week) { Date::Period::Week.new(Time.zone.today) }

    it { expect(Date::Period.new("week", Time.zone.today)).to eq(week) }
  end
end
