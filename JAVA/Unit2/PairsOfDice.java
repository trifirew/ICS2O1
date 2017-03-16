/*
 * Keisun Wu
 * 20170316
 * 2.4.3 Generate 100 pairs of dice
 */

import java.util.Random;

public class PairsOfDice {

  public static void main(String[] args) {
    Random r = new Random();
    int dice1, dice2;

    for (int i=1; i<=100; i++) {
      dice1 = r.nextInt(6);
      dice2 = r.nextInt(6);
      if (dice1 + dice2 == 2) {
        System.out.format("Round %2s: Snake eyes!\n", i);
      } else if (dice1 + dice2 == 7) {
        System.out.format("Round %2s: Lucky seven!\n", i);
      }
    }
  }
}
