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
