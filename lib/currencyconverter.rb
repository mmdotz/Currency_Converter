require_relative '../lib/currencyclass.rb'  # => true


class Converter

  attr_reader :country_conversions  # => nil

  def initialize
    @country_conversions = {"USD" =>1, "GBP" => 3.5, "JPN" => 2.3}
  end

  #without error
  def convert(currency_object, requested_country_code)
    #Converter.new.convert( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
    initial_object = currency_object
    #how do I create a new instance?
    rate = @country_conversions[requested_country_code]
    new_object = Currency.new(initial_object.amount_to_convert.*(rate), requested_country_code)
  end


  #with error
  # def convert(currency_object, requested_country_code)
  #   if @country_conversions.has_key?(requested_country_code)
  #     initial_object = currency_object
  #     rate = @country_conversions[requested_country_code]
  #     new_object = Currency.new(initial_object.amount_to_convert.*(rate), requested_country_code)
  #   else
  #     raise UnknownCurrencyCodeError
  #   end
  # end

  #OR
  #with error
  # def convert(currency_object, requested_country_code)
  #   if country_conversions[requested_country_code] == nil
  #     raise UnknownCurrencyCodeError
  #   else
  #     initial_object = currency_object
  #     rate = @country_conversions[requested_country_code]
  #     new_object = Currency.new(initial_object.amount_to_convert.*(rate), requested_country_code)
  #   end
  # end

end

class UnknownCurrencyCodeError < StandardError
  def message
    "That country code is not known."
  end
end


