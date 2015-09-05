
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/currencyclass.rb'  # => true

class CurrencyTest < Minitest::Test

  # def initialize(amount_to_convert, country_code)
  #   @country_code = country_code
  #   @amount_to_convert = amount_to_convert
  # end

  def test_currency_class_exists
    assert(Currency)              # => true
  end

  def test_plus_exists
    skip
    input_amount = Currency.new(1, "USD")
    assert_respond_to(input_amount, :plus)
  end

  def test_plus
    currency       = Currency.new(1, "USD") #given i have a currency
    other_currency = Currency.new(5, "USD") #when i add another currency
    expected       = Currency.new(6, "USD")       # => #<Currency:0x007fde4a149580 @amount_to_convert=6, @country_code="USD">
    actual         = (currency + other_currency)  # => #<Currency:0x007fde4a149378 @amount_to_convert=6, @country_code="USD">
    assert_equal(expected, actual)          #then i should have a new currency of the combination of them both
    # Currency.new(6, "USD")  (currency + other_currency)  # => false
  end

  def test_subtract
    currency       = Currency.new(5, "USD") #given i have a currency
    other_currency = Currency.new(1, "USD") #when i subtract another currency
    expected       = Currency.new(4, "USD")       # => #<Currency:0x007fde4a153dc8 @amount_to_convert=4, @country_code="USD">
    actual         = (currency - other_currency)  # => #<Currency:0x007fde4a14be48 @amount_to_convert=4, @country_code="USD">
    assert_equal(expected, actual)          #then i should have a new currency of the combination of them both
  end

  def test_if_two_different_currency_object_amounts_to_convert_are_not_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(3, "USD") #when I compare a currency with a different amount_to_convert
    assert(currency != other_currency)#then they are not equal
  end

  def test_if_two_different_currency_country_codes_are_not_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "EUR") #when I compare a currency with a different country_code
    assert(currency != other_currency) #then they are not equal
  end


  def test_if_two_identical_currency_object_amounts_to_convert_are_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "USD") #when I compare a currency with same type amount_to_convert
    assert(currency == other_currency)#then they are equal
  end


  def test_two_different_currency_country_codes_are_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "USD") #when I compare a currency with same country_code
    assert(currency == other_currency) #then they are equal
  end


  def test_if_exception_DifferentCurrencyCodeError_is_raised
    currency = Currency.new(1, "USD") #given I have a currency with a country A
    other_currency = Currency.new(1, "JPN") #an another country B
    assert_raises(DifferentCurrencyCodeError)  do #then I get an error
    (currency - other_currency) #when I try to subtract them
    end                                                       # => #<DifferentCurrencyCodeError: DifferentCurrencyCodeError>
  end

  def test_ability_to_multiply_fixed_and_float_numbers  #returns a number not an object
    skip
    currency = Currency.new(1, "USD") #given I have a currency
    conversion_multiplier = 30
   #when I multiply the currency by a conversion rate
    assert_equal(30, currency.amount_to_convert * 30) #integer
  end

  def test_ability_to_multiply_fixed_and_float_numbers
  currency = Currency.new(1, "USD") #given I have a currency
  conversion_multiplier = 30
   #when I multiply the currency by a conversion rate
  assert_equal(Currency.new(30, "USD"), Currency.new(currency.amount_to_convert * 30, currency.country_code) ) #returns NEW object with the WRONG country code
  end
end













# >> Run options: --seed 1261
# >>
# >> # Running:
# >>
# >> S......S..
# >>
# >> Finished in 0.007899s, 1265.9683 runs/s, 1012.7746 assertions/s.
# >>
# >> 10 runs, 8 assertions, 0 failures, 0 errors, 2 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
