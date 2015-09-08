require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/currencyconverter.rb'  # => true
require_relative '../lib/currencyclass.rb'      # => false

class CurrencyConverter < Minitest::Test

  def test_converter_class_exists
    assert(Converter)              # => true
  end

  def test_hash_not_empty
    # skip
    assert(@country_conversions != {})  # => true
  end

  def test_hash_key_format
    # skip
    q = Converter.new                                  # => #<Converter:0x007faca4010a38 @country_conversions={"USD"=>1, "GBP"=>0.65, "EUR"=>0.86}>
    assert_equal("USD", q.country_conversions.key(1))  # => true
  end

  def test_hash_value_format
    # skip
    q = Converter.new                                               # => #<Converter:0x007faca40102b8 @country_conversions={"USD"=>1, "GBP"=>0.65, "EUR"=>0.86}>
    #test pulling values out of hash                                # => #<Converter:0x007fa835023570 @country_conversions={"USD"=>1, "GBP"=>0.659}>
    assert_equal(1, q.country_conversions["USD"])                   # => true
    assert_equal(true, q.country_conversions["USD"].is_a?(Fixnum))  # => true
    assert_equal(true, q.country_conversions["GBP"].is_a?(Float))   # => true
  end

  def test_convert_with_known_code
    skip
    #Should be able to take a Currency object that has one currency code it knows and a
    #requested currency code and return a new
    #Currency object with the right amount in the new currency code.

    initial = Currency.new(5, "GBP")                # given a currency object
    requested_currency = "EUR"                      # and a requested currency code to convert
    q = Converter.new                                                                                                # => #<Converter:0x007faca3b177e8 @country_conversions={"USD"=>1, "GBP"=>0.65, "EUR"=>0.86}>
    initial_rate = q.country_conversions["GBP"]     #0.65
    requested_rate = q.country_conversions["EUR"]   #0.86
    converted_object = Currency.new(initial.amount_to_convert.*(
    (requested_rate/initial_rate)
    ), requested_currency)                          # => #<Currency:0x007faca3b172e8 @amount_to_convert=6.615384615384615, @country_code="EUR">
    assert_equal(Currency.new(6.615384615384615, "EUR"), converted_object )                                          # => true
  end

    def test_if_exception_UnknownCurrencyCodeError_is_raised
    # skip
      assert_raises(UnknownCurrencyCodeError)  do
      initial = Currency.new(5, "GBP")                  # given a currency object
      requested_currency = "wrong"                      # and a requested currency code to convert
      q = Converter.new
      initial_rate = q.country_conversions["GBP"]       #0.65
      requested_rate = q.country_conversions["wrong"]
      converted_object = Currency.new(initial.amount_to_convert.*(
        (requested_rate/initial_rate)
          ), requested_currency)
      end
    end
end





