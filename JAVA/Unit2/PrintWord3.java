/*
 * Keisun Wu
 * 20170314
 * 2.2.15 Print word in various ways
 */

import java.util.Scanner;
public class PrintWord3 {
  public static void main(String[] args) {
    String word;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a word: ");
    word = input.next();
    int wLength = word.length();
    System.out.println("");
    for (int i=0; i<wLength; i++) {
      System.out.format("%" + wLength +"s\n", word.substring(i, wLength));
    }
  }
}
