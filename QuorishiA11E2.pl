#NQ-BCS316
#Exercise 2 - Modify excercise 1 to repeatedly read the user's guess until the 
#user finds the correct number (then the program exits). If the user enters a non-number
#tell the user to enter a number and get the next input. If the user enters 
#“quit” exit the program. HINT: Use a while/defined loop to read user input and use 
#regular expressions to find out if the input is a number.
use 5.23.0;
use strict;
use warnings;

my $secret = int(1 + rand 100);
my $guess;

while (1) {
  print "Guess the secret number (between 1 and 100): ";
  $guess = <STDIN>;
  chomp $guess;

  #Checks if the user entered "quit":
  if ($guess =~ /^quit$/i) {
    print "Exiting the program. The secret number was $secret.\n";
    last;
  }

  #Checks if the user entered a number:
  if ($guess !~ /^[0-9]+$/) {
    print "Please enter a number.\n";
    next;
  }

  #Converts the user's guess to a number:
  $guess = int($guess);

  #Checks if the user guessed the secret number:
  if ($guess == $secret) {
    print "Congratulations! You guessed the secret number.\n";
    last;
  }

  #Checks if the user's guess was too high or too low:
  if ($guess > $secret) {
    print "Too high. Try again.\n";
  } else {
    print "Too low. Try again.\n";
  }
}
