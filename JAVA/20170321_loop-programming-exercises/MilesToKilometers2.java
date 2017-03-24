/*
 * Keisun Wu
 * 20170321
 * 4. Conversion table from miles to kilometres
 *    Starting value, ending value, and increments can be specified
 */

import java.util.Scanner;

public class MilesToKilometers2 {

  public static void main(String[] args) {
    int starting, ending, increments;
    Scanner input = new Scanner(System.in);

    System.out.print("Enter starting value of conversion table: ");
    starting = input.nextInt();
    System.out.print("Enter ending value of conversion table: ");
    ending = input.nextInt();
    System.out.print("Enter increments of conversion table: ");
    increments = input.nextInt();
    if (starting > ending) {
      System.out.println("Starting value is greater than ending value!");
    } else {
      System.out.printf("\nMILES%17sKILOMETERS\n\n", "");
      for (int mile=starting; mile<=ending; mile+=increments) {
        System.out.printf("%3s%20s%5.1f\n", mile, "", mile*1.6);
      }
    }
  }
}
