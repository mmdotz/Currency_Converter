# test_calculator.rb

def multiply(class, rate)
  if rate.is_a?(Float) || rate.is_a?(Fixnum)
  new_object = class * rate
  return new_object
end
