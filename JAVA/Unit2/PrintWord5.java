/*
 * Keisun Wu
 * 20170314
 * 2.2.17 Print word in various ways
 */

import java.util.Scanner;
public class PrintWord5 {
  public static void main(String[] args) {
    String word;
    String newWord = "";
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a word: ");
    word = input.next();
    int wLength = word.length();
    System.out.println("");
    for (int i=wLength-1; i>=0; i--) {
      newWord += word.charAt(i);
    }
    for (int i=0; i<wLength; i++) {
      newWord += word.charAt(i);
    }
    wLength = newWord.length();
    for (int i=0; i<wLength/2; i++) {
      System.out.format("%" + (wLength-i) + "s\n", newWord.substring(i, wLength-i));
    }
  }
}
