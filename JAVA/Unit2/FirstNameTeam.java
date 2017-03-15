/*
 * Keisun Wu
 * 20170314
 * 2.3.6 Divide students into 3 teams according to their first name
 */

import java.util.Scanner;
public class FirstNameTeam {
  public static void main(String[] args) {
    String name;
    Scanner input = new Scanner(System.in);

    for (int i=0; i<5; i++) {
      System.out.print("Enter a name: ");
      name = input.next();
      char initial = Character.toUpperCase(name.charAt(0));
      if (initial < 'A' || initial > 'Z') {
        System.out.println("Invalid name!");
      } else if (initial <= 'I') {
        System.out.println(name + " belongs to team 1");
      } else if (initial <= 'P') {
        System.out.println(name + " belongs to team 2");
      } else {
        System.out.println(name + " belongs to team 3");
      }
      System.out.println("");
    }
  }
}
