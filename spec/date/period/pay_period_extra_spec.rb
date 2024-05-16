RSpec.describe Date::Period::PayPeriod do
  context "class methods" do
    it(".origin") do
      origin = described_class.origin
      expect(origin).to be_a(Date)
      expect(origin.year).to eq(2012)
      expect(origin.month).to eq(1)
      expect(origin.day).to eq(1)
      expect(origin).to be_sunday
    end

    it(".duration") do
      expect(described_class.duration).to eq(14)
    end
  end

  context "instance" do
    subject { pay_period }

    let(:origin) { Date::Period::PayPeriod.origin }
    let(:now) { Time.now }
    let(:today) { now.to_date }
    let(:pay_period) { Date.pay_period(today) }
    let(:sunday) { Date.pay_period(pay_period.start_date) }
    let(:monday) { Date.pay_period(pay_period.start_date + 1) }
    let(:next_pay_period) { pay_period.next }
    let(:prev_pay_period) { pay_period.prev }
    let(:days_since_origin) { (today - origin).to_i }
    let(:weeks_since_origin) { days_since_origin / 7 }
    let(:week) { weeks_since_origin % 2 }
    let(:start_date) { pay_period.start_date }
    let(:end_date) { pay_period.end_date }
    let(:date_range) { pay_period.date_range }
    let(:start_time) { pay_period.start_time }
    let(:end_time) { pay_period.end_time }
    let(:time_range) { pay_period.time_range }

    it { expect(today.pay_period.date).to eq(today) }
    it { expect(pay_period.today).to eq(today) }
    it { expect(pay_period.start_date).to be_sunday }
    it { expect(pay_period.end_date).to be_saturday }
    it { expect(pay_period).to cover(today) }
    it { expect(pay_period).to cover(now) }
    it { expect(pay_period.next_start_date).to eq(next_pay_period.start_date) }
    it { expect(pay_period.prev_start_date).to eq(prev_pay_period.start_date) }
    it { expect(pay_period.index).to eq(weeks_since_origin / 2) }
    it { expect(pay_period.week).to eq(week) }
    it { expect(sunday).to be_beginning }
    it { expect(monday).to_not be_beginning }
    it { expect(date_range).to eq(start_date..end_date) }
    it { expect(time_range).to eq(start_time..end_time) }
  end

  # rubocop:disable RSpec/ExpectActual
  # expecting a literal date string makes these specs more readable
  describe ".number" do
    let(:date) { |example| example.description }
    it("2021/1/2") { expect(date).to be_in_pay_period(26).of_year(2020) }
    it("2021/1/3") { expect(date).to be_in_pay_period(1) }
    it("2021/7/4") { expect(date).to be_in_pay_period(14) }
    it("2021/7/31") { expect(date).to be_in_pay_period(15) }
  end
  # rubocop:enable RSpec/ExpectActual
end
