class Money

  def self.convert_to_integer(decimal_amount_as_string)
    integer = decimal_amount_as_string.delete(".").to_i()
  end

  def self.convert_to_decimal_string(integer)
    decimal_amount_as_string = integer.to_s().insert(-2,".")
  end

end
