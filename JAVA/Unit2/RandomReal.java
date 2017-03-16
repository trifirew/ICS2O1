/*
 * Keisun Wu
 * 20170316
 * 2.4.1 Print 20 random real numbers between 0 and 100
 */

public class RandomReal {

  public static void main(String[] args) {
    for (int i=1; i<=20; i++) {
      System.out.format("Number %2s: %-18s\n", i, Math.random() * 100);
    }
  }
}
