/*
 * Keisun Wu
 * 20170316
 * 2.4.4 Guess an integer between 1 and 100
 */

import java.util.Random;
import java.util.Scanner;

public class GuessNum1 {

  public static void main(String[] args) {
    int secret, guess;
    Scanner input = new Scanner(System.in);
    Random r = new Random();

    secret = r.nextInt(100);
    while (true) {
      System.out.print("Guess an integer between 1 and 100: ");
      guess = input.nextInt();
      if (guess > secret) {
        System.out.println("Too high, guess again.");
      } else if (guess < secret) {
        System.out.println("Too low, guess again.");
      } else {
        System.out.println("Congratulations!");
        break;
      }
    }
  }
}
