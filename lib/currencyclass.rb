class Currency

  attr_reader :amount_to_convert, :country_code  # => nil

  def initialize(amount, country)
    @amount_to_convert = amount
    @country_code = country

  end

  def ==(other)  #this is required to make the "No visible difference" error go away
    self.amount_to_convert == other.amount_to_convert &&
      self.country_code == other.country_code
  end

  def +(other)
    #Currency.new(5,"USD") needs to equal Currency.new(3, "USD")+(Currency.new(2, "USD")
    Currency.new(self.amount_to_convert + other.amount_to_convert, self.country_code)
  end

  def -(other)
    Currency.new(self.amount_to_convert - other.amount_to_convert, self.country_code)
  end

  def compare_currency_objects
    # if currency and other currency are not equal then return false
    if Currency.new(self.amount_to_convert) != Currency.new(other.amount_to_convert) ||
      Currency.new(self.country_code) != Currency.new(other.country_code)
      return false
    end
  end
end

class DifferentCurrencyCodeError < StandardError
  def message
    "You cannot add or subtract two Currency objects with different currency codes."
  end
end

def double(n)
  raise NotHowMathWorksError if n.is_a?(String)  # => nil, nil, nil, nil, nil, nil
  2 * n                                          # => 2, 6, 100, 0, 1000
end

[1, 3, 50, "fiibar", nil, 500].each do |number|   # => [1, 3, 50, "fiibar", nil, 500]
  begin
    double(number)                                # => 2, 6, 100, 0, 1000
  rescue NotHowMathWorksError => error
    puts "#{number.inspect} was not processable"  # => nil
  rescue TypeError => error
    puts "#{number.inspect} was illegal"          # => nil
  end                                             # => 2, 6, 100, nil, 0, 1000
end
