/*
 * Keisun Wu
 * 20170321
 * 2. Generate a number's multiplication table from 1 to 12
 */

import java.util.Scanner;

public class MultiplicationTable {

  public static void main(String[] args) {
    int num;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter a number: ");
    num = input.nextInt();

    for (int i=1; i<=12; i++) {
      System.out.format("%2s x %s = %s\n", i, num, i*num);
    }
  }
}
