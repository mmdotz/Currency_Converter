
class DifferentCurrencyCodeError < StandardError
  def message
    "You cannot add or subtract two Currency objects with different currency codes."
  end
end

class NotValidCountryCode < StandardError
  def message
    "That is not a valid country code. Please choose from this list: {hash of codes and conversion rates}"
  end
end

class Currency

  attr_reader :amount_to_convert, :country_code  # => nil

  def initialize(amount, country)
    @amount_to_convert = amount
    @country_code = country
  end

  # def ==(other)  #this is required to make the "No visible difference" error go away
  #     @amount_to_convert == other.amount_to_convert &&
  #     @country_code == other.country_code
  # end

  def ==(other)  #this is required to make the "No visible difference" error go away
      self.amount_to_convert == other.amount_to_convert &&
      self.country_code == other.country_code
  end

  def +(other)
    #Currency.new(5,"USD") needs to equal Currency.new(3, "USD")+(Currency.new(2, "USD")
    if self.country_code != other.country_code
      raise DifferentCurrencyCodeError
    else
      Currency.new(self.amount_to_convert + other.amount_to_convert, self.country_code)
    end
  end


  def -(other)
    if self.country_code != other.country_code
      raise DifferentCurrencyCodeError
    else
      Currency.new(self.amount_to_convert - other.amount_to_convert, self.country_code)
    end
  end

  def *(rate)
    if rate.is_a?(Fixnum) && rate.is_a?(Float)
    converted_object = Currency.new(self.amount * rate, self.country)
    return converted_object
    end
  end     #==>returns currency object

 #  def *(multiply)
 #   if multiply.is_a?(Currency)
 #     raise DifferentCurrencyCodeError if multiply.is_a?(Float) == false &&
 #     multiply._is_a?(Fixnum) == false
 #     new_convert = Currency.new(@amt_to_convert * multiply, @ccode)
 #     return new_convert
 #   end
 # end

 # def test_multiply_method
 #   currency       = Currency.new(10, "USD")               # => #<Currency:0x007fde4a1918f8 @amt_to_convert=10, @ccode="USD">
 #   multiple       = 3                                     # => 3
 #   expected       = Currency.new(30, "USD")                                    # => 30
 #   actual         = currency.amt_to_convert * multiple    # => 30
 #   assert_equal(30, actual)                               # => true
 # end


end


