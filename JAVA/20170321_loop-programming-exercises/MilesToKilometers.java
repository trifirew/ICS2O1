/*
 * Keisun Wu
 * 20170321
 * 3. Conversion table from miles to kilometres
 */

public class MilesToKilometers {

  public static void main(String[] args) {
    System.out.printf("MILES%17sKILOMETERS\n\n", "");
    for (int mile=5; mile<=100; mile+=5) {
      System.out.printf("%3s%20s%5.1f\n", mile, "", mile*1.6);
    }
  }
}
