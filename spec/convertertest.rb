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
    q = Converter.new                                  # => #<Converter:0x007f8f23b065d0 @country_conversions={"USD"=>1, "GBP"=>3.5}>
    assert_equal("USD", q.country_conversions.key(1))  # => true
  end

  def test_hash_value_format
    # skip
    q = Converter.new                                               # => #<Converter:0x007f8f23b06f58 @country_conversions={"USD"=>1, "GBP"=>3.5}>
    #test pulling values out of hash                      # => #<Converter:0x007fa835023570 @country_conversions={"USD"=>1, "GBP"=>0.659}>
    assert_equal(1, q.country_conversions["USD"])                   # => true
    assert_equal(true, q.country_conversions["USD"].is_a?(Fixnum))  # => true
    assert_equal(true, q.country_conversions["GBP"].is_a?(Float))   # => true
  end

  def test_convert_with_known_code
    skip #ok
    #Should be able to take a Currency object that has one currency code it knows and a
    #requested currency code and return a new
    #Currency object with the right amount in the new currency code.
    initial = Currency.new(1, "USD")      #given a currency object
    q = Converter.new                     # and a requested currency code to convert
    rate = q.country_conversions["GBP"]   #isolate the value at key
                                          # rate = 3.5
    new_object = Currency.new(initial.amount_to_convert.*(rate), "GBP")
    assert_equal(Currency.new(3.5, "GBP"), new_object ) #return a new Currency object
  end


  def test_if_exception_UnknownCurrencyCodeError_is_raised
    skip  #not working
    # raise UnknownCurrencyCodeError when attempt convert from/to currency code unknown to program
    initial = Currency.new(1, "USD")
    q = Converter.new
    assert_raises(UnknownCurrencyCodeError)  do
      q.country_conversions.has_key?("wrong") == nil
    end
  end

  def test_redo_convert_with_error
    skip #not working
    initial = Currency.new(1, "USD")
    expected_object = Currency.new(5, "GBP")
    q = Converter.new
    assert_equal(expected_object, q.convert(initial, "GBP"))
    currency_object = Currency.new(1, "USD")
    assert_raises(UnknownCurrencyCodeError) do
      #pass in wrong code how?
    end
  end

  def test_pass_in_third_country_code
  #Should be able to be created with a Hash of three or more currency codes
  #and conversion rates. An example would be this: {USD: 1.0, EUR: 0.74, JPY: 120.0},
  #which implies that a dollar is worth 0.74 euros and that a dollar is worth 120 yen,
  #but also that a euro is worth 120/0.74 = 162.2 yen.

  #assert_equal(expected, actual)
  end




end

