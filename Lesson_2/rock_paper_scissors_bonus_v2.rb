VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
                  'l' => 'lizard', 'S' => 'Spock' }
WINNING_COMBINATIONS = { 'r' => %w(s l), 'p' => %w(S r), 's' => %w(p l),
                         'S' => %w(s r), 'l' => %w(p S) }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def validate_player_choice(player_choice)
  VALID_CHOICES.keys.include?(player_choice)
end

def win?(first, second)
  WINNING_COMBINATIONS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("Props! You won that round.")
    "player"
  elsif win?(computer, player)
    prompt("Bummer! You lost that round.")
    "computer"
  else
    prompt("A tie!")
  end
end

def calculate_score(round_winner, scoreboard)
  case round_winner
  when "player"
    scoreboard[0] += 1
  when "computer"
    scoreboard[1] += 1
  end
end

scoreboard = [0, 0]
do_break = false
player_choice = ''
loop do
  prompt("Welcome to Rock Paper Scissors Lizard Spock!")
  prompt("First player to 5 wins")
  prompt("Enter Y to start")
  answer = Kernel.gets().chomp()
  break unless answer.casecmp('y').zero?

  loop do
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

    round_winner = display_results(player_choice, computer_choice[0])
    prompt("\n")
    calculate_score(round_winner, scoreboard)
    prompt("Score = You: #{scoreboard[0]} <> Computer: #{scoreboard[1]}")

    if scoreboard.include?(5)
      prompt("Game is over!")
      prompt("Want to play again? (Enter Y)")
      answer = Kernel.gets().chomp()
      if answer.casecmp('y').zero?
        scoreboard = [0, 0]
      else
        do_break = true
        break
      end
    else
      prompt("Keep going? (Enter Y)")
      answer = Kernel.gets().chomp()
      if answer.casecmp('y') != 0
        do_break = true
        break
      end
    end
  end

  break if do_break
end

prompt("Bye-bye! Sorry to see you go...")
