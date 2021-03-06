
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

  attr_reader :amount_to_convert, :country_code

  def initialize(amount, country)
    @amount_to_convert = amount
    @country_code = country
  end

  def ==(other)  #this is required to make the "No visible difference" error go away
      self.amount_to_convert == other.amount_to_convert &&
      self.country_code == other.country_code
  end

  def +(other)
    if other.is_a?(Currency)
    raise DifferentCurrencyCodeError if @country_code != other.country_code
      new_amount =  @amount_to_convert + other.amount_to_convert
      Currency.new(new_amount, @country_code)
    end
  end

  def -(other) #working
    if other.is_a?(Currency)
      raise DifferentCurrencyCodeError if @country_code != other.country_code
      new_amount =  @amount_to_convert - other.amount_to_convert
      Currency.new(new_amount, @country_code)
    end
  end

  def *(rate)
    if rate.is_a?(Fixnum) || rate.is_a?(Float)
    new_amount = amount_to_convert * rate
    Currency.new(new_amount, @country_code)
    end
  end     #==>returns currency object


  def /(other)  #OK to have 2 diff country codes
    if other.is_a?(Currency)
      new_amount = other.amount_to_convert / @amount_to_convert
      Currency.new(new_amount, other.country_code)
    end
  end

end
