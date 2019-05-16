# This function converts integers from zero to 999,999 to words

#Improved the solution I had presented during the interview to one that uses recursion

def integer_word(n)
  if n < 0
    return "not a positive integer"
  end

  int_words = Hash.new()
  int_words[0] = "one"
  int_words[1] = "one"
  int_words[2] = "two"
  int_words[3] = "three"
  int_words[4] = "four"
  int_words[5] = "five"
  int_words[6] = "six"
  int_words[7] = "seven"
  int_words[8] = "eight"
  int_words[9] = "nine"
  int_words[10] = "ten"
  int_words[11] = "eleven"
  int_words[12] = "twelve"
  int_words[13] = "thirteeen"
  int_words[14] = "fourteen"
  int_words[15] = "fifteen"
  int_words[16] = "sixteen"
  int_words[17] = "seventeen"
  int_words[18] = "eighteen"
  int_words[19] = "nineteen"
  int_words[20] = "twenty"
  int_words[30] = "thirty"
  int_words[40] = "fourty"
  int_words[50] = "fifty"
  int_words[60] = "sixty"
  int_words[70] = "seventy"
  int_words[80] = "eighty"
  int_words[90] = "ninety"

  result = ""

  if n < 21
    result << int_words[n]
  elsif n > 20 && n < 100
    quotient = n.divmod(10).first
    remainder = n.divmod(10).last
    if remainder == 0
      result << int_words[quotient * 10]
    else
      result << int_words[quotient * 10] << " " << integer_word(remainder)
    end
  elsif n > 99 && n < 1000
    quotient = n.divmod(100).first
    remainder = n.divmod(100).last
    if remainder == 0
      result << "#{int_words[quotient]} hundred"
    else
      result << "#{int_words[quotient]} hundred and " << integer_word(remainder)
    end
  elsif n > 999 && n < 1000000
    quotient = n.divmod(1000).first
    remainder = n.divmod(1000).last
    if remainder == 0
      result << "#{integer_word(quotient)} thousand"
    else
      result << "#{integer_word(quotient)} thousand " << integer_word(remainder)
    end
  else
    result << "number is not in the range of 0 to 999,999"
  end
  return result
end
