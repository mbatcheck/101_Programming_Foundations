def prompt(message)
  puts "=> #{message}"
end

def validate_float(number)
  Float(number)
rescue ArgumentError
  false
end

prompt("Welcome to mortgage calculator!")

loop do
  loan_amt = ''
  apr = ''
  int_mos = ''
  loan_yrs = ''
  loan_mos = ''
  loop do
    loop do
      prompt("Enter the total loan amount")
      loan_amt = gets.chomp.delete("$").delete(",")

      if loan_amt.to_f >= 0.01 && validate_float(loan_amt)
        break
      else
        prompt("Sorry, that's not a valid loan amount")
      end
    end

    loop do
      prompt("Enter the APR (Annual Percentage Rate)")
      apr = gets.chomp

      if apr.to_f >= 0.000 && validate_float(apr)
        break
      else
        prompt("Sorry, that's not a valid APR")
      end
    end

    loop do
      prompt("Enter the length of the loan in years")
      loan_yrs = gets.chomp

      if loan_yrs.to_f >= 0.1 && validate_float(loan_yrs)
        break
      else
        prompt("Sorry, that's not a valid loan length")
      end
    end

    int_mos = (apr.to_f / 12) * 0.01
    loan_mos = loan_yrs.to_f * 12

    summary_prompt = <<-MSG
    You have entered:
        Loan amount: #{format('$%.2f', loan_amt.to_f.round(2))}
        Annual Percentage Rate (APR): #{apr}
        Loan length: #{loan_yrs} years (#{loan_mos.to_i} months)
    MSG

    prompt(summary_prompt)

    prompt("Is this correct? Any key to continue, N to start over")
    continue = gets.chomp
    break unless continue.downcase().start_with?('n')
  end

  if apr.to_f <= 0
    monthly_pmt = loan_amt.to_f / loan_mos.to_f
  else
    monthly_pmt = loan_amt.to_f *
                  int_mos.to_f /
                  (1 - (1 + int_mos.to_f)**-loan_mos.to_f)
  end

  prompt("Your monthly payment: #{format('$%.2f', monthly_pmt.to_f.round(2))}")

  prompt("Hit Y for another calculation")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

prompt("See ya later, loan calculator")
