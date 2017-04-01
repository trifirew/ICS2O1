/*
 * Keisun Wu
 * 20170328
 * 8. Count the number of names entered by user until user enters capital word "END"
 */

import java.util.Scanner;

public class CountName {

  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);
    String name;
    int count = 0;

    do {
      System.out.print("Enter a name: ");
      name = input.nextLine();
      if (name.equals("END")) {
        break;
      }
      count ++;
    } while (true);
    
    System.out.println(count);
  }
}
