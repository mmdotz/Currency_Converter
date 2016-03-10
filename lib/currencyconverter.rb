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

  #any to any conversion
  def convert(currency_object, requested_country_code)
    raise UnknownCurrencyCodeError if @country_conversions[requested_country_code]  == nil
    initial_rate = @country_conversions[currency_object.country_code]
    requested_rate = @country_conversions[requested_country_code]
    converted_object = Currency.new(currency_object.amount_to_convert.*((requested_rate/initial_rate)), requested_country_code)
  end
end


cq = Currency.new(2, "USD")
ccq = Converter.new.convert(cq, "EUR")
puts "#{cq.amount_to_convert} #{cq.country_code} is equal to #{ccq.amount_to_convert} #{ccq.country_code}"
