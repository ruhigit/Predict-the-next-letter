# Predict-the-next-letter
Given a training file, outputs the word count, frequency, average_position and the most likely letter to be followed.

Usage: string_manipulation.rb FILENAME
where FILENAME is the input training text file to learn from.

OUTPUT:


1. Each individual sentence along with a word count for the sentence (for this purpose, a sentence can be defined as anything ending with a period).

2. For each case­insensitive letter, the number of times that letter appears in the entire text. E.g. the text contains 50 As, 40 Bs, etc.

3. For each case insensitive letter, the average character position of the first occurrence of that letter in each sentence (ignoring sentences that don't contain the letter). E.g. the letter A occurs, on average, at index 10 of a sentence.

4. For each case insensitive letter, the letter that is most likely to follow it, over the entire text. E.g. X is most likely to be followed by Y.
