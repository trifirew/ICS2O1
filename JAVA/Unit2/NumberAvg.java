/*
 * Keisun Wu
 * 20170314
 * 2.2.7 Calculate the average of 5 numbers
 */

import java.util.Scanner;
public class NumberAvg {
  public static void main(String[] args) {
    int sum = 0;
    double avg;
    Scanner input = new Scanner(System.in);
    for (int i=0; i<5; i++) {
      System.out.print("Enter a number: ");
      sum += input.nextInt();
    }
    avg = (double)sum / 5;
    System.out.println("Average is " + avg);
  }
}
