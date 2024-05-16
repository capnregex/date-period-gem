RSpec.describe Date::Period::PayPeriod do
  let(:date) { Date.new(2020, 1, 7) }
  let(:pay_period) { date.period(:pay_period) }
  let(:pay_period_starts) { Date.new(2020, 1, 5) }
  let(:pay_period_ends) { Date.new(2020, 1, 18) }
  let(:prev_pay_period_starts) { Date.new(2019, 12, 22) }
  let(:prev_pay_period_ends) { Date.new(2020, 1, 4) }
  let(:next_pay_period_starts) { Date.new(2020, 1, 19) }
  let(:next_pay_period_ends) { Date.new(2020, 2, 1) }

  it(".date") { expect(pay_period.date).to eq(date) }
  it(".start_date") { expect(pay_period.start_date).to eq(pay_period_starts) }
  it(".end_date") { expect(pay_period.end_date).to eq(pay_period_ends) }
  it(".prev.date") { expect(pay_period.prev.date).to eq(date - 14.days) }
  it(".prev.start_date") { expect(pay_period.prev.start_date).to eq(prev_pay_period_starts) }
  it(".prev.end_date") { expect(pay_period.prev.end_date).to eq(prev_pay_period_ends) }
  it(".next.date") { expect(pay_period.next.date).to eq(date + 14.days) }
  it(".next.start_date") { expect(pay_period.next.start_date).to eq(next_pay_period_starts) }
  it(".next.end_date") { expect(pay_period.next.end_date).to eq(next_pay_period_ends) }

  describe(".weeks_to_start") do
    it { expect(pay_period.weeks_to_start).to eq(0) }
    it { expect(pay_period.weeks_to_start(date.advance(weeks: 1))).to eq(1) }
  end
end
