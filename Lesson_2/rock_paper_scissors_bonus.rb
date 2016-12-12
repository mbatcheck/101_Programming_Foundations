VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
                  'l' => 'lizard', 'S' => 'Spock' }

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
    "player"
  elsif win?(computer, player)
    prompt("You lost!")
    "computer"
  else
    prompt("A tie!")
  end
end

score = [0, 0]
loop do
  player_choice = ''
  loop do
    prompt("Choose one (case-sensitive):")
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

  winner = display_results(player_choice, computer_choice[0])

  if winner == "player"
    score[0] += 1
  elsif winner == "computer"
    score[1] += 1
  end
  prompt("Score = You: #{score[0]} <> Computer: #{score[1]}")

  prompt("Play again? Hit Y")
  answer = Kernel.gets().chomp()
  break unless answer.casecmp('y').zero?
end

prompt("Sorry to see you go!")
