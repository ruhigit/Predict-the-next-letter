# Author: Ruhi Agarwal
# Date Created: March 2, 2015


## The program takes the first argument as the input training file name
## For each case letter that is most likely to follow it, over the entire text. E.g. X is most likely to be followed by Y, the input is x
## Iterate through the training data once and output the required output.
class RubyCode

  def string_manipulation(filename)


    ##The character_count is a hashmap to store the count of individual characters
    character_count = Hash.new
    ##The position of that character in the entire text file
    character_position=Hash.new

    ##The data structure to predict the most  likely letter given a letter as input
    ##For prediction of the next letter, Naive Bayes algorithm is implemented.
    ##Our dictionary naive_bayes_model is a model that assign class labels to letter, where the class labels are drawn from training text.
    naive_bayes_model=Hash.new

    ##Open the input file
    text=File.open(filename).read

    ##For each sentence(ends with '.') count the number of words in it
    text.each_line('.') do |line|

      line=line.strip
      ##The number of words is equal to the number of whitespaces+1
      count_words=line.gsub(/\s+/m, ' ').strip.split(" ").length
      if not count_words.zero?
        puts "Line:#{line}\tCount:#{count_words}"
      end
      ##Covert everything to uppercase to make it case insensitive
      line=line.upcase
      found=Hash.new
    ##Iterate over each character
      prev=nil
      line.each_char.with_index(1) {|c,pos|

        ##Initiliaze data structures if keys not present to hold the respective details
        if not character_count.has_key?(c)
          character_count[c]=0
          character_position[c]=0
          naive_bayes_model[c]=Hash.new
        end
        ##Increment the character count
        character_count[c]+=1
        ##Add the character position for average
        if not found.has_key?(c)
        character_position[c]+=pos
        found[c]=true
        end
        ##To check what letter follows a given letter
        ##Check for first character in the string
        if not prev.nil?
          ##Store the frequency of each letter to be followed given the previous letter
          if not naive_bayes_model[c].has_key?(prev)
            naive_bayes_model[c][prev]=0
          end
          naive_bayes_model[c][prev]+=1
        end
        prev=c
      }
    end
    puts"-------------------------------------\n"
    puts"The number of times that each letter appears in the entire text \n#{character_count}"
    ##Average the character positions
    character_position.each do |key,value|
      character_position[key]/=character_count[key]
    end
    puts"-------------------------------------\n"
    puts"The average position of each letter that appears in the entire text \n#{character_position}"

    puts
    puts
    puts"-------------------------------------\n"
    puts "Enter a character for prediction of next character:"
    feature=STDIN.getc
    ##feature='a'
    feature=feature.capitalize
    max_class=nil
    max=0
    ##We take the maximum liklehood of the next letter followed the given letter
    naive_bayes_model.each_key do |class_name|

      prior=character_count[class_name]
      if ('A'..'Z').include?(class_name) and naive_bayes_model[class_name].has_key?(feature)
        prob_class_given_letter=prior*naive_bayes_model[class_name][feature]
        if prob_class_given_letter>max or max_class.nil?
          max=prob_class_given_letter
          max_class=class_name
        end
      end
    end
      if not max_class.nil?
        puts "#{feature} is most likely to be followed by:#{max_class}"
      else
        puts "No sufficient data to predict"
      end
  end
  end
if __FILE__ == $0
  filename=ARGV[0]
   obj=CodingChallenge.new()
  obj.string_manipulation(filename)
end
