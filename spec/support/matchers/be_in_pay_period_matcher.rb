RSpec::Matchers.define :be_in_pay_period do |expected|
  match do |actual|
    date = Date.parse(actual)
    @year ||= date.year
    pay_period = date.pay_period
    pay_period.number == expected && pay_period.year == @year
  end

  chain :of_year do |year|
    @year = year
  end
end
