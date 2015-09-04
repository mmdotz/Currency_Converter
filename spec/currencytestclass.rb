require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/currencyclass.rb'  # => true

class CurrencyTest < Minitest::Test

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
    expected       = Currency.new(6, "USD")
    actual         = (currency + other_currency)
    assert_equal(expected, actual)          #then i should have a new currency of the combination of them both
    # Currency.new(6, "USD")  (currency + other_currency)  # => false
  end

  def test_subtract
    currency       = Currency.new(1, "USD") #given i have a currency
    other_currency = Currency.new(5, "USD") #when i subtract another currency
    expected       = Currency.new(6, "USD")
    actual         = (currency - other_currency)
    assert_equal(expected, actual)          #then i should have a new currency of the combination of them both
  end

  def test_if_two_different_currency_objects_are_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(5, "USD") #when I compare a currency with a different amount_to_convert
    assert(currency != other_currency)#then they are not equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "EUR") #when I compare a currency with a different country_code
    assert(currency != other_currency) #then they are not equal
  end

  def test_if_two_identical_currency_objects_are_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "USD") #when I compare a currency with a different amount_to_convert
    assert(currency == other_currency)#then they are not equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "USD") #when I compare a currency with a different country_code
    assert(currency != other_currency) #then they are not equal
  end


  def test_if_exception_DifferentCurrencyCodeError_is_raised
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(5, "USD")#when I compare a currency with a different amount_to_convert
    raise DifferentCurrencyCodeError if currency != other_currency
  end

end












