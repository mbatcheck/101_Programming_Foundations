def prompt(message)
  Kernel.puts("=> #{message}")
end

def validate(number)
  number.to_i != 0
end

def operation_to_message(op)
  case op
  when '+'
    'Adding'
  when '-'
    'Subtracting'
  when '*'
    'Multiplying'
  when '/'
    'Dividing'
  end
end

prompt("Welcome to calculator! Enter your name")

user_name = ''
loop do
  user_name = Kernel.gets().chomp()
  if user_name.empty?()
    prompt("Be sure to give your name")
  else
    break
  end
end

loop do
  num1 = ''
  loop do
    prompt("#{user_name}, please give me a number")
    num1 = Kernel.gets().chomp()

    if validate(num1)
      break
    else
      prompt("Oops, that's not a number, #{user_name} !")
    end
  end

  num2 = ''
  loop do
    prompt("#{user_name}, please give me another number")
    num2 = Kernel.gets().chomp()

    if validate(num2)
      break
    else
      prompt("Oops, that's not a number, #{user_name} !")
    end
  end

  operation_prompt = <<-MSG
  Please tell me what type of operation to perform?
    (+)
    (-)
    (*)
    (/)
  MSG

  prompt(operation_prompt)

  operation = ''
  loop do
    operation = Kernel.gets().chomp()
    if %w(+ - * /).include?(operation)
      break
    else
      prompt("Must enter (+) (-) (*) (/)")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
           when '+'
             num1.to_i() + num2.to_i()
           when '-'
             num1.to_i() - num2.to_i()
           when '*'
             num1.to_i() * num2.to_i()
           when '/'
             num1.to_f() / num2.to_f()
           else
             Kernel.puts("I'm confused by that input")
           end

  prompt("The final result is #{result}")

  prompt("#{user_name}, do you want to do another calculation? Y?")
  continue = Kernel.gets().chomp()
  break unless continue.downcase().start_with?('y')
end

prompt("See ya later calculator")
