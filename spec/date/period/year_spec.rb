RSpec.describe Date::Period::Year do
  let(:date) { Date.new(2020, 1, 7) }
  let(:year) { Date::Period.new(:year, date) }
  let(:year_starts) { Date.new(2020, 1, 1) }
  let(:year_ends) { Date.new(2020, 12, 31) }
  let(:prev_date) { Date.new(2019, 1, 7) }
  let(:prev_year_starts) { Date.new(2019, 1, 1) }
  let(:prev_year_ends) { Date.new(2019, 12, 31) }
  let(:next_date) { Date.new(2021, 1, 7) }
  let(:next_year_starts) { Date.new(2021, 1, 1) }
  let(:next_year_ends) { Date.new(2021, 12, 31) }

  it(".date") { expect(year.date).to eq(date) }
  it(".start_date") { expect(year.start_date).to eq(year_starts) }
  it(".end_date") { expect(year.end_date).to eq(year_ends) }
  it(".prev.date") { expect(year.prev.date).to eq(prev_date) }
  it(".prev.start_date") { expect(year.prev.start_date).to eq(prev_year_starts) }
  it(".prev.end_date") { expect(year.prev.end_date).to eq(prev_year_ends) }
  it(".next.date") { expect(year.next.date).to eq(next_date) }
  it(".next.start_date") { expect(year.next.start_date).to eq(next_year_starts) }
  it(".next.end_date") { expect(year.next.end_date).to eq(next_year_ends) }
end
