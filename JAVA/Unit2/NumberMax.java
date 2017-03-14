/*
 * Keisun Wu
 * 20170314
 * 2.2.8 Return the largest of 5 numbers
 */

import java.util.Scanner;
public class NumberMax {
  public static void main(String[] args) {
    int maxNum;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a number: ");
    maxNum = input.nextInt();
    for (int i=0; i<4; i++) {
      System.out.print("Enter a number: ");
      maxNum = Math.max(maxNum, input.nextInt());
    }
    System.out.println("Max number is " + maxNum);
  }
}
