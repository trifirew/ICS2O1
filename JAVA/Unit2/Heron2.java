/*
 * Keisun Wu
 * 20170314
 * 2.3.3 Check if 3 sides can form a triangle, then calculate the area.
 */

import java.util.Scanner;
public class Heron2 {
  public static void main(String[] args) {
    double a, b, c, s, area;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter the first side of triangle: ");
    a = input.nextDouble();
    System.out.print("Enter the second side of triangle: ");
    b = input.nextDouble();
    System.out.print("Enter the third side of triangle: ");
    c = input.nextDouble();

    s = (a + b + c) / 2;
    if (a < s && b < s && c < s) {
      area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
      System.out.println("The area of the triangle is " + area);
    } else {
      System.out.println("No triangle can be formed.");
    }
  }
}
