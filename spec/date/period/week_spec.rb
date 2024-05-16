RSpec.describe Date::Period::Week do
  let(:today) { Time.zone.today }
  let(:date) { Date.new(2020, 1, 7) }
  let(:week) { Date::Period.new(:week, date) }
  let(:week_starts) { Date.new(2020, 1, 5) }
  let(:week_ends) { Date.new(2020, 1, 11) }
  let(:prev_week_starts) { Date.new(2019, 12, 29) }
  let(:prev_week_ends) { Date.new(2020, 1, 4) }
  let(:next_week_starts) { Date.new(2020, 1, 12) }
  let(:next_week_ends) { Date.new(2020, 1, 18) }

  it(".date") { expect(week.date).to eq(date) }
  it(".start_date") { expect(week.start_date).to eq(week_starts) }
  it(".end_date") { expect(week.end_date).to eq(week_ends) }
  it(".prev.date") { expect(week.prev.date).to eq(date - 7.days) }
  it(".prev.start_date") { expect(week.prev.start_date).to eq(prev_week_starts) }
  it(".prev.end_date") { expect(week.prev.end_date).to eq(prev_week_ends) }
  it(".next.date") { expect(week.next.date).to eq(date + 7.days) }
  it(".next.start_date") { expect(week.next.start_date).to eq(next_week_starts) }
  it(".next.end_date") { expect(week.next.end_date).to eq(next_week_ends) }

  it(".days_to_start") { expect(week.days_to_start).to eq(2) }
  it(".days_to_end") { expect(week.days_to_end).to eq(4) }

  it(".date_range") do
    range = week.date_range
    expect(range.begin).to eq(week_starts)
    expect(range.end).to eq(week_ends)
  end

  it(".time_range") do
    range = week.time_range
    expect(range.begin).to eq(week_starts.in_time_zone)
    expect(range.end).to eq(week_ends.in_time_zone.end_of_day)
  end

  describe(".beginning?") do
    it { expect(week).to_not be_beginning }
    it { expect(week).to be_beginning(week_starts) }
  end

  describe(".days") do
    let(:days) { week.days }

    it { expect(days.length).to eq(7) }
    it { expect(days.first).to eq(week_starts) }
    it { expect(days[2]).to eq(date) }
    it { expect(days.last).to eq(week_ends) }
  end

  describe(".day") do
    it { expect(week.get_day(2)).to eq(date) }
    it { expect(week.get_day(-5)).to eq(date) }
  end
end
