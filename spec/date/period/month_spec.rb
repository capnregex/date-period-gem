RSpec.describe Date::Period::Month do
  let(:date) { Date.new(2020, 1, 7) }
  let(:next_date) { Date.new(2020, 2, 7) }
  let(:prev_date) { Date.new(2019, 12, 7) }
  let(:month) { Date::Period.new(:month, date) }
  let(:month_starts) { Date.new(2020, 1, 1) }
  let(:month_ends) { Date.new(2020, 1, 31) }
  let(:prev_month_starts) { Date.new(2019, 12, 1) }
  let(:prev_month_ends) { Date.new(2019, 12, 31) }
  let(:next_month_starts) { Date.new(2020, 2, 1) }
  let(:next_month_ends) { Date.new(2020, 2, 29) }

  it(".date") { expect(month.date).to eq(date) }
  it(".start_date") { expect(month.start_date).to eq(month_starts) }
  it(".end_date") { expect(month.end_date).to eq(month_ends) }
  it(".prev.date") { expect(month.prev.date).to eq(prev_date) }
  it(".prev.start_date") { expect(month.prev.start_date).to eq(prev_month_starts) }
  it(".prev.end_date") { expect(month.prev.end_date).to eq(prev_month_ends) }
  it(".next.date") { expect(month.next.date).to eq(next_date) }
  it(".next.start_date") { expect(month.next.start_date).to eq(next_month_starts) }
  it(".next.end_date") { expect(month.next.end_date).to eq(next_month_ends) }
end
