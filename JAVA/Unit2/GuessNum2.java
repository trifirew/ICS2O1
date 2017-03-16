/*
 * Keisun Wu
 * 20170316
 * 2.4.5 Guess an integer between 1 and 100, and count the number of guesses
 */

import java.util.Random;
import java.util.Scanner;

public class GuessNum2 {

  public static void main(String[] args) {
    int secret, guess, counter;
    Scanner input = new Scanner(System.in);
    Random r = new Random();

    secret = r.nextInt(100);
    counter = 0;
    while (true) {
      System.out.print("Guess an integer between 1 and 100: ");
      guess = input.nextInt();
      counter++;
      if (guess > secret) {
        System.out.println("Too high, guess again.");
      } else if (guess < secret) {
        System.out.println("Too low, guess again.");
      } else {
        System.out.print("Congratulations! ");
        System.out.println("You've guessed for " + counter + " times.");
        break;
      }
    }
  }
}
