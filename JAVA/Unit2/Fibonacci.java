/*
 * Keisun Wu
 * 20170314
 * 2.2.12 Calculate the nth Fibonacci number
 */

import java.util.Scanner;
public class Fibonacci {
  public static void main(String[] args) {
    int n;
    int fibo = 1;
    int oldFibo = 0;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter a positive number: ");
    n = input.nextInt();
    for (int i=2; i<=n; i++) {
      fibo += oldFibo;
      oldFibo = fibo - oldFibo;
    }
    System.out.println("The Fibonacci number is " + fibo);
  }
}
