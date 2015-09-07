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
    #if @country_code || requested_country_code is not in hash
    if @country_conversions.include?(requested_country_code)
    initial_object = currency_object
    rate = @country_conversions[requested_country_code]
    new_object = Currency.new(initial_object.amount_to_convert.*(rate), requested_country_code)
    else
      raise UnknownCurrencyCodeError
    end
  end
end




