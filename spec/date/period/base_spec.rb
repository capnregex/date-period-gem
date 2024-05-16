RSpec.describe Date::Period::Base do
  let(:today) { Time.zone.today }
  let(:date) { Date.new(2020, 1, 7) }
  let(:day) { Date::Period::Base.new(date) }
  let(:prev_date) { Date.new(2020, 1, 6) }
  let(:next_date) { Date.new(2020, 1, 8) }

  it(".today") { expect(day.today).to eq(today) }
  it(".date") { expect(day.date).to eq(date) }
  it(".start_date") { expect(day.start_date).to eq(date) }
  it(".end_date") { expect(day.end_date).to eq(date) }
  it(".prev.date") { expect(day.prev.date).to eq(prev_date) }
  it(".prev.start_date") { expect(day.prev.start_date).to eq(prev_date) }
  it(".prev.end_date") { expect(day.prev.end_date).to eq(prev_date) }
  it(".next.date") { expect(day.next.date).to eq(next_date) }
  it(".next.start_date") { expect(day.next.start_date).to eq(next_date) }
  it(".next.end_date") { expect(day.next.end_date).to eq(next_date) }
end
