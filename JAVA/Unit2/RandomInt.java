/*
 * Keisun Wu
 * 20170316
 * 2.4.2 Print 20 random integers between 0 and 100
 */

import java.util.Random;

public class RandomInt {

  public static void main(String[] args) {
    Random r = new Random();

    for (int i=1; i<=20; i++) {
      System.out.format("Number %2s: %-18s\n", i, r.nextInt(100));
    }
  }
}
