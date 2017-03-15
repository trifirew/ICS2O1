/*
 * Keisun Wu
 * 20170314
 * 2.3.4 Enter a mark, determine the grade
 */

import java.util.Scanner;
public class MarkGrade {
  public static void main(String[] args) {
    byte mark;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter your mark: ");
    mark = input.nextByte();
    if (mark < 0 || mark > 100) {
      System.out.println("Invalid Number!");
    } else if (mark >= 90) {
      System.out.println("Grade A+");
    } else if (mark >= 80) {
      System.out.println("Grade A");
    } else if (mark >= 70) {
      System.out.println("Grade B");
    } else if (mark >= 60) {
      System.out.println("Grade C");
    } else if (mark >= 50) {
      System.out.println("Grade D");
    } else {
      System.out.println("Grade F");
    }
  }
}
