RSpec.describe Date::Period::Custom do
  let(:start_date) { Date.new(2023, 1, 2) }
  let(:end_date_provided) { Date.new(2023, 1, 9) }
  let(:end_date_default) { Date.new(2023, 1, 6) }

  context 'when initialized without an end_date' do
    let(:custom) { described_class.new(start_date) }

    it 'has a default duration of five days' do
      expect(described_class.duration).to eq(5)
    end

    it ".date returns the start date" do
      expect(custom.date).to eq(start_date)
    end

    it ".end_date return date after default duration" do
      expect(custom.end_date).to eq(end_date_default)
    end
  end

  context 'when initialized with a specific end date' do
    let(:custom) { described_class.new(start_date, end_date: end_date_provided) }

    it ".end_date returns the provided end date" do
      expect(custom.end_date).to eq(end_date_provided)
    end
  end
end
