require_relative '../lib/currencyclass.rb'  # => true


class Converter

  attr_reader :country_conversions  # => nil

  def initialize
    @country_conversions = {"USD" => 1, "GBP" => 0.659}
  end

  def view_hash
    c = Converter.new
    c.country_conversions
  end

  def convert(currency_object, requested_country_code)
    # (new currency object with new country code, new amount)#how to replace the country code?
    currency_converter.convert( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
  end

  def throw_error
    c = Converter.new
    unless @country_conversions.has_key(requested_country_code)
      raise UnknownCurrencyCodeError
    end
  end

end








class UnknownCurrencyCodeError < StandardError
  def message
    "That country code is not known."
  end
end


