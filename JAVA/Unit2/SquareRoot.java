/*
 * Keisun Wu
 * 20170314
 * 2.3.2 Calculate square root
 */

import java.util.Scanner;
public class SquareRoot {
  public static void main(String[] args) {
    double num, result;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter a number: ");
    num = input.nextDouble();
    if (num < 0) {
      System.out.println("Negative numbers do not have a square root value.");
    } else {
      result = Math.sqrt(num);
      System.out.println("Square root value is " + result);
    }
  }
}
