/*
* Keisun Wu
* 20170318
* 2.4.6 A variation of the game of 21
*/

import java.util.*;

public class TwentyOne {

  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);
    Random r = new Random();
    int[] num = {0, 0, 0, 0};
    int sum = 0;

    for (byte i=0; i<2; i++) {
      num[i] = r.nextInt(10) + 1;
      sum += num[i];
      System.out.println("Number " + (i+1) + " is " + num[i]);
    }

    if (sum >= 18 && sum <=21) {
      System.out.println("You WIN!");
    } else if(sum < 18) {
      while (true) {
        System.out.print("Do you want 1 or 2 additional numbers? ");
        byte additionalNum = input.nextByte();
        if (additionalNum == 1 || additionalNum == 2) {
          for (byte i=2; i<additionalNum+2; i++) {
            num[i] = r.nextInt(10) + 1;
            sum += num[i];
            System.out.println("Number " + (i+1) + " is " + num[i]);
          }
          break;
        } else {
          System.out.println("Invalid option!");
        }
      }
      if (sum < 18) {
        System.out.println("You LOSE!");
      } else if (sum > 21) {
        System.out.println("You WIN!");
      }
    }
  }
}
