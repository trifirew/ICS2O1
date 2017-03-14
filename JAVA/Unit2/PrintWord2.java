/*
 * Keisun Wu
 * 20170314
 * 2.2.14 Print word in various ways
 */

import java.util.Scanner;
public class PrintWord2 {
  public static void main(String[] args) {
    String word;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a word: ");
    word = input.next();
    int wLength = word.length();
    System.out.println("");
    for (int i=0; i<wLength; i++) {
      System.out.println(word.substring(i, wLength));
    }
  }
}
