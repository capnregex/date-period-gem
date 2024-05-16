RSpec.describe Date::Period::Days do
  let(:date) { Date.new(2023, 1, 2) }
  let(:days) { Date::Period.new(:days, date) }
  let(:end_date) { Date.new(2023, 1, 6) }
  let(:prev_date) { Date.new(2022, 12, 28) }
  let(:next_date) { Date.new(2023, 1, 7) }

  it 'has a duration of 5' do
    expect(described_class.duration).to eq(5)
  end

  it(".date") { expect(days.date).to eq(date) }
  it(".end_date") { expect(days.end_date).to eq(end_date) }
  it(".prev.date") { expect(days.prev.date).to eq(prev_date) }
  it(".next.date") { expect(days.next.date).to eq(next_date) }
end
