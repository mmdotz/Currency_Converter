require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currencyconverter.rb'
require_relative '../lib/currencyclass.rb'

class CurrencyConverter < Minitest::Test

  def test_converter_class_exists
    assert(Converter)
  end

  def test_hash_not_empty
    assert(@country_conversions != {})
  end

  def test_if_exception_UnknownCurrencyCodeError_is_raised
    # skip
    q = Converter.new
    assert_raises(DifferentCurrencyCodeError)  do
      @country_conversions.has_key?("wrong")
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
    q = Converter.new
    #test pulling values out of hash                      # => #<Converter:0x007fa835023570 @country_conversions={"USD"=>1, "GBP"=>0.659}>
    assert_equal(1, q.country_conversions["USD"])
    assert_equal(true, q.country_conversions["USD"].is_a?(Fixnum))
    assert_equal(true, q.country_conversions["GBP"].is_a?(Float))
  end


end
