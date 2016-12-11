VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
                  'l' => 'lizard', 'S' => 'Spock' }
@player_score = 0
@computer_score = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def validate_player_choice(player_choice)
  VALID_CHOICES.keys.include?(player_choice)
end

def win?(first, second)
  (first == 'r' && %w(s l).include?(second)) ||
    (first == 'p' && %w(S r).include?(second)) ||
    (first == 's' && %w(p l).include?(second)) ||
    (first == 'S' && %w(s r).include?(second)) ||
    (first == 'l' && %w(p S).include?(second))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
    display_score("player")
  elsif win?(computer, player)
    prompt("You lost!")
    display_score("computer")
  else
    prompt("A tie!")
    display_score("")
  end
end

def display_score(winner)
  if winner == "player"
    @player_score += 1
  elsif winner == "computer"
    @computer_score += 1
  end
    prompt("The score: You: #{@player_score} <> Computer: #{@computer_score}")
end

loop do
  player_choice = ''
  loop do
    prompt("Choose one:")
    VALID_CHOICES.each { |key, value| prompt("Enter #{key} for #{value}") }

    player_choice = Kernel.gets().chomp()

    if validate_player_choice(player_choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.to_a.sample

  prompt("You chose: #{VALID_CHOICES[player_choice]}; Computer chose: "\
         "#{computer_choice[1]}")

  display_results(player_choice, computer_choice[0])

  prompt("Play again? Hit Y")
  answer = Kernel.gets().chomp()
  break unless answer.casecmp('y').zero?
end

prompt("Sorry to see you go!")
