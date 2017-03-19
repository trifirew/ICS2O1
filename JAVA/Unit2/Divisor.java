/*
 * Keisun Wu
 * 20170318
 * 2.4.8 Find all the divisors of an integer
 */

import java.util.Scanner;

public class Divisor {

  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);
    int n;

    System.out.print("Enter an integer: ");
    n = input.nextInt();
    System.out.println("All the divisors of " + n);
    for (int d=1; d<=n; d++) {
      if (n % d == 0) {
        System.out.printf("%-10s", d);
      }
    }
  }
}
