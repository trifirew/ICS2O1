/*
 * Keisun Wu
 * 20170314
 * 2.2.13 Print word in various ways
 */

import java.util.Scanner;
public class PrintWord1 {
  public static void main(String[] args) {
    String word;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a word: ");
    word = input.next();
    int wLength = word.length();
    System.out.println("");
    for (int i=wLength; i>0; i--) {
      System.out.println(word.substring(0, i));
    }
  }
}
