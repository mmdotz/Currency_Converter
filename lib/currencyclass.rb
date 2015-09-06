
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
    if other.is_a?(Currency) && if self.country_code.==(other.country_code)
      new_amount = other.amount_to_convert + @amount_to_convert
      Currency.new(new_amount, @country_code)
    else
    raise DifferentCurrencyCodeError
    end
  end
    #   #OR
    # else
    #   Currency.new(self.amount_to_convert + other.amount_to_convert, self.country_code)
    # end
  end

  def -(other)
    if other.is_a?(Currency) && self.country_code.==(other.country_code)
      new_amount = other.amount_to_convert - @amount_to_convert
      Currency.new(new_amount, @country_code)
    else
    raise DifferentCurrencyCodeError
    end
  end

  # def -(other)
  #   if self.country_code != other.country_code
  #     raise DifferentCurrencyCodeError
  #   else
  #     Currency.new(self.amount_to_convert - other.amount_to_convert, self.country_code)
  #   end
  # end

  def *(rate)
    if rate.is_a?(Fixnum) || rate.is_a?(Float)
    new_amount = amount_to_convert * rate
    Currency.new(new_amount, @country_code)
    end
  end     #==>returns currency object
end


