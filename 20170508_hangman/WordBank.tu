/* Keisun Wu
 * 20170518
 * WordBank
 * All words of Hangman game
 */

unit
module WordBank
    export words
    type Word :
	record
	    word : string
	    hint : string
	end record
    var words : array 0 .. * of Word := init (
	init ("apple", "Fruits"),
	init ("banana", "Fruits"),
	init ("cherry", "Fruits"),
	init ("coconut", "Fruits"),
	init ("grape", "Fruits"),
	init ("kiwi", "Fruits"),
	init ("lemon", "Fruits"),
	init ("mango", "Fruits"),
	init ("orange", "Fruits"),
	init ("papaya", "Fruits"),
	init ("peach", "Fruits"),
	init ("pear", "Fruits"),
	init ("pineapple", "Fruits"),
	init ("strawberry", "Fruits"),
	init ("watermelon", "Fruits"),
	init ("cat", "Animals"),
	init ("crocodile", "Animals"),
	init ("dog", "Animals"),
	init ("donkey", "Animals"),
	init ("elephant", "Animals"),
	init ("frog", "Animals"),
	init ("hamster", "Animals"),
	init ("horse", "Animals"),
	init ("leopard", "Animals"),
	init ("pig", "Animals"),
	init ("whale", "Animals"),
	init ("Australia", "Countries"),
	init ("Britain", "Countries"),
	init ("Canada", "Countries"),
	init ("China", "Countries"),
	init ("Cuba", "Countries"),
	init ("Denmark", "Countries"),
	init ("Egypt", "Countries"),
	init ("France", "Countries"),
	init ("Germany", "Countries"),
	init ("India", "Countries"),
	init ("Iran", "Countries"),
	init ("Japan", "Countries"),
	init ("Korea", "Countries"),
	init ("Luxembourg", "Countries"),
	init ("Mexico", "Countries"),
	init ("New Zealand", "Countries"),
	init ("Russia", "Countries"),
	init ("Thailand", "Countries"),
	init ("United States", "Countries"),
	)
end WordBank
