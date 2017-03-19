/*
 * Keisun Wu
 * 20170318
 * 2.4.7 A variation of the game of NIM
 */

import java.util.*;

public class Nim {

  public static void main(String[] args) {
    Random r = new Random();
    Scanner input = new Scanner(System.in);
    int totalCoins = r.nextInt(11) + 9;
    int tookCoins = 0;
    int player = -1;
    int take;

    System.out.println("We have " + totalCoins + " coins in total this time.");
    while (tookCoins < totalCoins) {
      player++;
      System.out.println("It's Player " + (player%2+1) + "'s turn.");
      do {
        System.out.print("Do you want to take 1, 2, or 3 coins? ");
        take = input.nextInt();
      } while (take < 1 || take > 3);
      tookCoins += take;

    }
    System.out.println("Player " + (player%2+1) + " WIN!");
  }
}
