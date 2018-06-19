class Money

  def self.convert_to_integer(decimal_amount_as_string)
    if decimal_amount_as_string.include?(".")
      return integer = decimal_amount_as_string.delete(".").to_i
    else
      return decimal_amount_as_string.to_i * 100
    end
  end

  def self.convert_to_decimal_string(integer)
    if 0 <= integer && integer < 100
      decimal_amount_as_string = "0.%02d" % [integer]
    elsif 0 > integer && integer > -100
      decimal_amount_as_string = "-0.%02d" % [integer]
    else
      decimal_amount_as_string = integer.to_s().insert(-3,".")
    end
  end

end
