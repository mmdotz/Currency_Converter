require_relative '../lib/currencyclass.rb'  # => true


class Converter

  attr_reader :country_conversions  # => nil

  def initialize
    @country_conversions = {"USD" =>1, "GBP" => 3.5}
  end

  def view_hash
    q = Converter.new
    q.country_conversions
  end

  def convert(currency_object, requested_country_code)
    #Converter.new.convert( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
    initial_object = currency_object
    #how do I create a new instance?
    rate = @country_conversions[requested_country_code]
    new_object = Currency.new(initial_object.amount_to_convert.*(rate), requested_country_code)
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

  #cannot finish until convert works
  def throw_error
    q = Currency.new(1, "USD")
    unless @country_conversions.has_key?(requested_country_code)
      raise UnknownCurrencyCodeError
    end
  end

end







class UnknownCurrencyCodeError < StandardError
  def message
    "That country code is not known."
  end
end


