/*
 * Keisun Wu
 * 20170314
 * 2.3.5 Solve quadratic equation
 */

import java.util.Scanner;
public class QuadEquation {
  public static void main(String[] args) {
    double a, b, c;
    Scanner input = new Scanner(System.in);

    System.out.println("Ax^2 + Bx + C = 0");
    System.out.print("Enter A: ");
    a = input.nextDouble();
    System.out.print("Enter B: ");
    b = input.nextDouble();
    System.out.print("Enter C: ");
    c = input.nextDouble();

    double delta = b*b - 4*a*c;
    if (delta > 0) {
      double root1 = (-b + Math.sqrt(delta)) / (2 * a);
      double root2 = (-b - Math.sqrt(delta)) / (2 * a);
      System.out.println("x = " + root1 + " or " + root2);
    } else if (delta == 0) {
      double root = -(b / (2 * a));
      System.out.println("x = " + root);
    } else {
      System.out.println("No real root.");
    }
  }
}
