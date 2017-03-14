/*
 * Keisun Wu
 * 20170314
 * 2.2.16 Print word in various ways
 */

import java.util.Scanner;
public class PrintWord4 {
  public static void main(String[] args) {
    String word;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter a word: ");
    word = input.next();
    int wLength = word.length();
    System.out.println("");
    for (int i=0; i<2*wLength; i+=2) {
      word = word.substring(0, i+1) + "-" + word.substring(i+1);
    }
    wLength = word.length();
    for (int i=0; i<wLength/2; i++) {
      System.out.format("%" + (wLength-i) + "s\n", word.substring(0, wLength-2*i-1));
    }
  }
}
