#Word Guess Game - Sara Stiltner and Lily Sky
#ADA c9
#Week 2
#Pair Programming exercise

#============ GEMS ========

require "colorize"
require "colorized_string"
require "awesome_print"

#============ CLASS ========

class Word

  attr_reader :word, :word_array
  attr_writer :letter
  attr_accessor :working_word, :word_length

  def initialize(word)
    @word = word
  end

  def word_length
    @word.length
  end

  def word_to_array
    word_array = @word.chars
    return word_array
  end

  def working_word
    working_word = []
    @word.length.times do |i|
      working_word << "_ "
    end
    return working_word
  end
end

#============ STORAGE ========

library = ["LOVE", 'CUPID', "HEART", "ROSES", "GALENTINE", "ROMANCE", "HYGGE", "SECURITY", "SWEETHEART", "INSURANCE", "CHOCOLATE", "ATTENTION", "FLOWERS", "ADORATION", "AFFECTION", "HONEY", "DINNER", "DRAMA", "DELUSION", "SOULMATE", "PANCAKES", "COURT", "CRUSH", "SWEETHEART", "CONSENT"]

heart = [ "   .:::.   .:::.   ".colorize(:red), "  :::::::.:::::::  ".colorize(:red), "  :::::::::::::::  ".colorize(:red), "   '::::::::::::'  ".colorize(:red), "     ':::::::'    ".colorize(:red), "        ':'      ".colorize(:red)]



#============ PLAY GAME ========

word = library.sample
problem = Word.new(word)

working_word_game = problem.working_word
word_array = problem.word_to_array

counter = 6 #set to lines in heart
guesses = [] #bin for wrong guesses

puts "\n========== 💒 Welcome to Valentine's Word Guess Game 💒 =========="
puts "\nMission:"
puts "\n  ❧" + " Your aim is to guess the #{word.length }-letter word by guessing letters.".colorize(:blue)
puts "\n  ❧" + " Your aim is to guess the word by guessing letters.".colorize(:blue)
puts "\nRules:"
puts "\n  ❧ You have #{counter} lives."
puts "\n  ❧ If your entries are wrong, the heart will disapear and you will die!"
puts "\n- - - - - - - - - - - - - - PLAY GAME - - - - - - - - - - - - - -"

36.times do
  puts
  puts heart[0..counter-1] #heart sinks as you do worse in the game
  puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + + + +"

  #get and hold user input to play game
  print "\n💝 Guess a letter or try for the word ➢ "

  input = gets.chomp.upcase.to_s

  #option to enter word or letter and consequences for each
  if input.length > 1 && input == word
    puts "\n     💕 💗 💖 💞 💓 ❤️  Correct! Hooray, you won! ❤️ 💓 💞 💖 💗 💕"
    puts
    exit
  elsif input.length > 1 && input != word
    if counter >= 1
      counter -= 1
    puts "\n     💔 Heartbreak! You are incorrect."
    elsif counter == 0
    puts "\n     💔 You die, love lost💔 "
    puts "\n In lieu of a puppy, here is the word: " + word
    puts
    exit
    end
  else
    until input =~ /^[A-Z]{1}$/i && guesses.include?(input) == false
      print "Guess a valid letter: "
      input = gets.chomp.upcase.to_s
    end
    if word_array.include?(input) == false
      guesses.push(input)
      counter -= 1
      puts "\n     #{input} not included!".colorize(:green,)
    else
      word.length.times do |i|
        if input == word_array[i]
          working_word_game[i] = "#{input} "
        end
      end
    end
  end

#continutaion of consequences to end game and offer feedback
 if word_array.include?(input) == false && counter == 0
   puts "\n     💔 Love lost, you lost 💔 "
   puts "\n In lieu of a puppy, here is the word: " + word
   puts
   exit
 elsif working_word_game.include?("_ ") == false
   puts "\n     💕 💗 💖 💞 💓 ❤️  Hooray, you won! ❤️ 💓 💞 💖 💗 💕"
   puts
   exit
 elsif word_array.include?(input) == true
   puts "\n     Great job! #{input} is included!".colorize(:magenta)
 end

#output to display lives left
 puts "\n     Lives left: " + counter.to_s

 #output to display bin of letters already tried
 print "     This is your bin: "
 guesses.each do |input|
   print "#{input} "
 end
 puts

 #output to display current progress with working word
 print "     Current progress: "
 working_word_game.each do |input|
   print "#{input} "
 end
 puts
end
