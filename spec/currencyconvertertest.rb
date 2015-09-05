require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/currencyconverter.rb'  # => true
require_relative '../lib/currencyclass.rb'      # => false

class CurrencyConverter < Minitest::Test

  def test_converter_class_exists
    assert(Converter)              # => true
  end

  def test_hash_not_empty
    assert(@country_conversions != {})  # => true
  end

  def test_hash_key_format
    skip
    assert(@country_conversions[:key].is_a?(String))
  end

  def test_hash_value_format
    skip
    assert(@country_conversions[:key].is_a?(Integer) || @country_conversions[:key].is_a?(Float))
  end

  def test_convert
    initial_object_to_convert = Currency.new(1, "USD")#given a currency object
    converted_object = initial_object_to_convert.*(0.89)
    converted_object = Currency.new(0.89, "USD") #when I pass in the rate multiplier, I get a new converted_object
    Converter.new.convert(converted_object), "EUR") #and when pass converted_object into Converter.new.convert
    assert_equal()
  end

#Anisha
# def convert(currency_object,desired_country_code)
#     currency1 = Currency.new(1, "USD")
#     Currency.new(currency1.*(0.74),
#       desired_country_code)
#   end



end
