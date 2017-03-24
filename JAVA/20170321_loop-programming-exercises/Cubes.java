/*
 * Keisun Wu
 * 20170321
 * 1. Print the cubes of numbers from 1 to 12
 */

public class Cubes {

  public static void main(String[] args) {
    for (int i=1; i<=12; i++) {
      System.out.println("The cube of " + i + " is " + (int)Math.pow(i, 3) + ".");
    }
  }
}
