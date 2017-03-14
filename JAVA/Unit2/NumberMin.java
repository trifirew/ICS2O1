/*
 * Keisun Wu
 * 20170314
 * 2.2.9 Return the smallest of 5 numbers
 */

import java.util.Scanner;
public class NumberMin {
  public static void main(String[] args) {
    int minNum;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a number: ");
    minNum = input.nextInt();
    for (int i=0; i<4; i++) {
      System.out.print("Enter a number: ");
      minNum = Math.min(minNum, input.nextInt());
    }
    System.out.println("Min number is " + minNum);
  }
}
