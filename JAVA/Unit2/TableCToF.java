/*
 * Keisun Wu
 * 20170313
 * 2.2.5 Conversion table for Celsius to Fahrenheit
 */

public class TableCToF {
  public static void main(String[] args) {
    System.out.printf("| %-10s | %-10s |\n", "Celsius", "Fahrenheit");
    System.out.println("|------------|------------|");
    for (short i=-30; i<=100; i+=5) {
      double c = (double)i;
      double f = c * 9.0 / 5.0 + 32;
      System.out.printf("| %10.0f | %10.0f |\n", c, f);
    }
  }
}
