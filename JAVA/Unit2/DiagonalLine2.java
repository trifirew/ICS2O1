/*
 * Keisun Wu
 * 20170314
 * 2.2.19 Print a diagonal line "/"
 */

import java.util.Scanner;
public class DiagonalLine2 {
  public static void main(String[] args) {
    int n;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter a number between 1 and 20: ");
    n = input.nextInt();
    if (n >= 1 && n <= 20) {
      for (int i=1; i<n; i++) {
        System.out.format("%-" + (n-i) + "s*\n", "");
      }
      System.out.println("*");
    } else {
      System.out.println("Invalid number!");
    }
  }
}
