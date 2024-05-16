RSpec.describe Date::Period::Quarter do
  let(:date) { Date.new(2020, 1, 7) }
  let(:quarter) { Date::Period.new(:quarter, date) }
  let(:quarter_starts) { Date.new(2020, 1, 1) }
  let(:quarter_ends) { Date.new(2020, 3, 31) }
  let(:prev_date) { Date.new(2019, 10, 7) }
  let(:prev_quarter_starts) { Date.new(2019, 10, 1) }
  let(:prev_quarter_ends) { Date.new(2019, 12, 31) }
  let(:next_date) { Date.new(2020, 4, 7) }
  let(:next_quarter_starts) { Date.new(2020, 4, 1) }
  let(:next_quarter_ends) { Date.new(2020, 6, 30) }

  it(".date") { expect(quarter.date).to eq(date) }
  it(".start_date") { expect(quarter.start_date).to eq(quarter_starts) }
  it(".end_date") { expect(quarter.end_date).to eq(quarter_ends) }
  it(".prev.date") { expect(quarter.prev.date).to eq(prev_date) }
  it(".prev.start_date") { expect(quarter.prev.start_date).to eq(prev_quarter_starts) }
  it(".prev.end_date") { expect(quarter.prev.end_date).to eq(prev_quarter_ends) }
  it(".next.date") { expect(quarter.next.date).to eq(next_date) }
  it(".next.start_date") { expect(quarter.next.start_date).to eq(next_quarter_starts) }
  it(".next.end_date") { expect(quarter.next.end_date).to eq(next_quarter_ends) }
end
