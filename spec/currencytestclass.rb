
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/currencyclass.rb'  # ~> SyntaxError: /Users/mdotz/theironyard/projects/currency_converter/lib/currencyclass.rb:44: syntax error, unexpected end-of-input, expecting keyword_end

class CurrencyTest < Minitest::Test

  def test_currency_class_exists
    assert(Currency)
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
    currency       = Currency.new(5, "USD") #given i have a currency
    other_currency = Currency.new(1, "USD") #when i subtract another currency
    expected       = Currency.new(4, "USD")
    actual         = (currency - other_currency)
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


  def two_different_currency_country_codes_are_equal
    currency = Currency.new(1, "USD") #given I have a currency
    other_currency = Currency.new(1, "USD") #when I compare a currency with same country_code
    assert(currency == other_currency) #then they are equal
  end


  def test_if_exception_DifferentCurrencyCodeError_is_raised
    currency = Currency.new(1, "USD") #given I have a currency with a country A
    other_currency = Currency.new(1, "JPN") #an another country B
    assert_raises(DifferentCurrencyCodeError)  do #then I get an error
      (currency - other_currency) #when I try to subtract them
    end
  end

  def test_new_object_when_multiplied
    currency = Currency.new(1, "USD") #given I have a currency with a country A
    other_currency = Currency.new(10, "USD") #and another country A
    assert_equal(Currency.new(10, "USD"), (currency * other_currency)) #when I try to multiply them
  end
end













# >> Run options: --seed 3062
# >>
# >> # Running:
# >>
# >>
# >>
# >> Finished in 0.000817s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> SyntaxError
# ~> /Users/mdotz/theironyard/projects/currency_converter/lib/currencyclass.rb:44: syntax error, unexpected end-of-input, expecting keyword_end
# ~>
# ~> /Users/mdotz/theironyard/projects/currency_converter/spec/currencytestclass.rb:5:in `require_relative'
# ~> /Users/mdotz/theironyard/projects/currency_converter/spec/currencytestclass.rb:5:in `<main>'
