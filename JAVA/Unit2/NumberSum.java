/*
 * Keisun Wu
 * 20170314
 * 2.2.6 Calculate the sum of 5 numbers
 */

import java.util.Scanner;
public class NumberSum {
  public static void main(String[] args) {
    int sum = 0;
    Scanner input = new Scanner(System.in);
    for (int i=0; i<5; i++) {
      System.out.print("Enter a number: ");
      sum += input.nextInt();
    }
    System.out.println("Sum is " + sum);
  }
}
