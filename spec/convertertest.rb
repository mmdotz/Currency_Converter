require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currencyconverter.rb'
require_relative '../lib/currencyclass.rb'

class CurrencyConverter < Minitest::Test

  def test_converter_class_exists
    assert(Converter)
  end

  def test_hash_not_empty
    # skip
    assert(@country_conversions != {})
  end

  def test_if_exception_UnknownCurrencyCodeError_is_raised
    skip #this won;t work until the convert method is written because it requires the requested_country_code argument
    q = Converter.new
    assert_raises(DifferentCurrencyCodeError)  do
      q.country_conversions.has_key?("wrong")
    end
  end

  # def test_print_contents_of_hash
  #   #this will break when update initialize with arguments
  #   c = Converter.new
  #   assert({:USD => 1, :GBP => 0.659})
  # end

  def test_hash_key_format
    # skip
    q = Converter.new
    assert_equal("USD", q.country_conversions.key(1))
  end

  def test_hash_value_format
    # skip
    q = Converter.new
    #test pulling values out of hash                      # => #<Converter:0x007fa835023570 @country_conversions={"USD"=>1, "GBP"=>0.659}>
    assert_equal(1, q.country_conversions["USD"])
    assert_equal(true, q.country_conversions["USD"].is_a?(Fixnum))
    assert_equal(true, q.country_conversions["GBP"].is_a?(Float))
  end

  def test_convert
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

end









