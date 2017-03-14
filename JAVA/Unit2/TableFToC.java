/*
 * Keisun Wu
 * 20170313
 * 2.2.4 Conversion table for Fahrenheit to Celsius
 */

public class TableFToC {
  public static void main(String[] args) {
    System.out.printf("| %-10s | %-10s |\n", "Fahrenheit", "Celsius");
    System.out.println("|------------|------------|");
    for (short i=-20; i<=220; i+=10) {
      double f = (double)i;
      double c = (f - 32) * 5.0 / 9.0;
      System.out.printf("| %10.0f | %10.0f |\n", f, c);
    }
  }
}
