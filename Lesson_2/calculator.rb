=begin
Build a command line calculator program that does the following:
- asks for two numbers
- asks for the type of operation to perform: add, subtract, multiply or divide
displays the result
- Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output.
Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().
=end

# my attempt
Kernel.puts("Please give me a number")
num1 = Kernel.gets().chomp()

Kernel.puts("Okay, give me another number")
num2 = Kernel.gets().chomp()

Kernel.puts("Please tell me what type of operation to perform? (+) (-) (*) (/) ?")
operation = Kernel.gets().chomp()

result = case operation
  when '+'
    num1.to_i() + num2.to_i()
  when '-'
    num1.to_i() - num2.to_i()
  when '+'
    num1.to_i() * num2.to_i()
  when '/'
    num1.to_f() / num2.to_f()
  else
    Kernel.puts("I'm confused by that input")
end

Kernel.puts("The final result is #{result}")
