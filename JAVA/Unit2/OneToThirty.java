/*
 * Keisun Wu
 * 20170313
 * 2.2.3 Print the numbers from 1 to 30 by 2's, by 3's
 */

public class OneToThirty {
  public static void main(String[] args) {
    for (short i=1; i<=30; i+=2) {
      System.out.println(i);
    }
    System.out.println("");
    for (short i=1; i<=30; i+=3) {
      System.out.println(i);
    }
  }
}
