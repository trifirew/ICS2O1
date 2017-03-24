/*
 * Keisun Wu
 * 20170322
 * 5. Guess a random number between 1 and 10
 */

import java.util.*;

public class Guess1 {

  public static void main(String[] args) {
    int num, guess;
    Random r = new Random();
    Scanner input = new Scanner(System.in);

    num = r.nextInt(10) + 1;
    System.out.print("Guess a number between 1 and 10: ");
    do {

      do {
        guess = input.nextInt();
        if (guess < 1 || guess > 10) {
          System.out.print("Invalid number, enter again: ");
        }
      } while (guess < 1 || guess > 10);

      if (guess != num) {
        System.out.print("Wrong! Guess again: ");
      }
    } while (guess != num);
    System.out.println("You got it right!");
  }
}
