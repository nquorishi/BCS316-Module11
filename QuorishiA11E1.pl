#NQ-BCS316
#Exercise 1 - Make a program that will repeatedly ask the user to guess a secret number 
#from 1 to 100 until the user guesses the secret number. Your program should pick 
#the number at random by using the magical formula int(1 + rand 100). When the user 
#guesses wrong, the program should respond, “Too high” or “Too low.” If the user enters 
#the word quit or exit, or if the user enters a blank line, the program should quit. 
#Of course, if the user guesses correctly, the program should display a message 
#telling the userthey selected the correct number. 
use 5.23.0;
use strict;
use warnings;

#Picks a random number between 1 and 100:
my $secret_number = int(1 + rand 100);

print "Guess the secret number between 1 and 100, or type 'quit' or 'exit' to exit.\n";

#Loops until the user guesses the correct number or quits:
while (1) {
    #Prompts the user for a guess:
    print "Enter your guess: ";
    my $guess = <STDIN>;
    chomp($guess);

    #Checks if the user wants to quit:
    if (lc($guess) eq 'quit' or lc($guess) eq 'exit') {
        print "Goodbye!\n";
        last;
    }

    #Checks if the user's guess is a valid number:
    while (!defined($guess) or $guess !~ /^\d+$/) {
        print "Please enter a number between 1 and 100, or type 'quit' or 'exit' to exit.\n";
        print "Enter your guess: ";
        $guess = <STDIN>;
        chomp($guess);

        if (lc($guess) eq 'quit' or lc($guess) eq 'exit') {
            print "Goodbye!\n";
            last;
        }
    }

    #Checks if the user's guess is too high or too low:
    if ($guess > $secret_number) {
        print "Too high\n";
    } elsif ($guess < $secret_number) {
        print "Too low\n";
    } else {
        #The user guessed the correct number, so exits the loop:
        print "Congratulations! You guessed the secret number.\n";
        last;
    }
}
