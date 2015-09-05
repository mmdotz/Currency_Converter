require_relative '../lib/currencyclass.rb'  # => true


class Converter

  attr_accessor :country_conversions  # => nil

  def initialize
    country_conversions = {:USD => 1, :GBP => 0.659}
  end

  def convert(currency_object, requested_country_code)
    # (new currency object with new country code, new amount)#how to replace the country code?

  end

end

class UnknownCurrencyCodeError < StandardError
  def message
    "That country code is not known."
  end
end
