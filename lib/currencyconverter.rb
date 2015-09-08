require_relative '../lib/currencyclass.rb'  # => true

class UnknownCurrencyCodeError < StandardError
  def message
    "That country code is not known."
  end
end

class Converter

  attr_reader :country_conversions  # => nil

  def initialize
    @country_conversions = {"USD" =>1, "GBP" => 0.65, "EUR" => 0.86}
  end

  #error not working, any requested country_code given
  def convert(currency_object, requested_country_code)
    raise UnknownCurrencyCodeError if @conversion_rates[requested_country_code]  == nil
    initial_object = currency_object
    requested_currency = requested_country_code
    initial_rate = @country_conversions[initial_object.country_code]
    requested_rate = @country_conversions[requested_country_code]
    # requested_rate = q.convert(initial, "wrong") #how do I call this in the method itself? Justin's code

    converted_object = Currency.new(initial_object.amount_to_convert.*(rate), requested_country_code)
  end
end

#if @country_code || requested_country_code is not included in hash





