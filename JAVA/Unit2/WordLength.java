/*
 * Keisun Wu
 * 20170314
 * 2.3.7 Print XXXX if a word contains four letters
 */

import java.util.Scanner;
public class WordLength {
  public static void main(String[] args) {
    String word;
    Scanner input = new Scanner(System.in);

    for (int i=0; i<5; i++) {
      System.out.print("Enter a word: ");
      word = input.next();
      if (word.length() == 4) {
        System.out.println("XXXX");
      } else {
        System.out.println(word);
      }
      System.out.println("");
    }
  }
}
