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

  #one to one conversion
  # def convert(currency_object, requested_country_code)
  #   raise UnknownCurrencyCodeError if @country_conversions[requested_country_code]  == nil
  #   initial_object = currency_object
  #   requested_currency = requested_country_code
  #   initial_rate = @country_conversions[initial_object.country_code]
  #   requested_rate = @country_conversions[requested_country_code]
  #   converted_object = Currency.new(initial_object.amount_to_convert.*(requested_rate), requested_country_code)
  # end

  #write so that any currency can be converted to any other currency

  #any to any conversion
  def convert(currency_object, requested_country_code)
    raise UnknownCurrencyCodeError if @country_conversions[requested_country_code]  == nil
    initial_rate = @country_conversions[currency_object.country_code]
    requested_rate = @country_conversions[requested_country_code]
    converted_object = Currency.new(currency_object.amount_to_convert.*((requested_rate/initial_rate)), requested_country_code)
  end

end






