/*
 * Keisun Wu
 * 20170314
 * 2.3.1 Enter a mark, determine PASS or FAIL
 */

import java.util.Scanner;
public class MarkPass {
  public static void main(String[] args) {
    byte mark;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter your mark: ");
    mark = input.nextByte();
    if (mark < 0 || mark > 100) {
      System.out.println("Invalid Number!");
    } else if (mark < 50) {
      System.out.println("FAIL");
    } else {
      System.out.println("PASS");
    }
  }
}
