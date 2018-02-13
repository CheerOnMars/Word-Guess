#Word Guess Game - Sara Stiltner and Lily Sky
#ADA c9
#Week 2
#Pair Programming exercise


#============ Class ========

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

  # def word_isolate
  #   :word_array = @word.chars
  # end


end

#============ MAIN ========

library = ["apples", "orange", "marker", "papers"]
heart = [ "   .:::.   .:::.   ", "  :::::::.:::::::  ", "  :::::::::::::::  ", "   '::::::::::::'  ", "     ':::::::'    ", "        ':'      "]



#============ GAME ========

word = library.sample
problem = Word.new(word)

working_word_game = problem.working_word
word_array = problem.word_to_array



counter = 6 #perhaps adjust to number of unique letters in the word, we want a gameover message
guesses = [] #wrong guesses

puts "\n==================== Welcome to Word Guess Game ========================="
puts "\nRules: You have #{counter} lives. If you lose lives, the heart will disapear and you will die!"
puts "\nYour aim is to guess the word by guessing letters."

puts "\n+++++++++++++++++++++++ PLAYGAME +++++++++++++++++++++"

# puts "Press esc to exit at any time"


#begin game, 5 times arbitrary for now
5.times do
  #ART HEART
  puts
  puts heart[0..counter-1]
  print "\n😃 Guess a letter: "
  letter = gets.chomp.upcase.to_s

  puts "\n \n"

#must be valid letter not one already given
 until letter =~ /^[A-Z]{1}$/i
   #&& guesses.include?(letter) == false
   print "Guess a valid letter: "
   letter = gets.chomp.upcase.to_s
 end

 #if incorrect, keep in guesses array and counter goes down
 if word_array.include?(letter) == false
   guesses.push(letter)
   counter -= 1
   puts "#{letter} not included!"
 else
   word.length.times do |i|
     if letter == word_array[i]
       working_word_game[i] = "#{letter} "
     end
   end
 end

#output results and end game
 if word_array.include?(letter) == false && counter == 0
   puts "you die"
   exit
 elsif working_word_game.include?("_ ") == false
   puts "Hooray, you won!"
   exit
 elsif word_array.include?(letter) == true
   puts "you did right"
 end

 puts "\nLives left: " + counter.to_s
 puts

 #visually see letters already tried'
 print "This is your bin: "
 guesses.each do |letter|
   print "#{letter} "
 end

 puts

 #display current progress with working word
 print "Current progress: "
 working_word_game.each do |letter|
   print "#{letter} "
 end
 puts
 puts word
 puts

end

#++++++++++++++++ Bike Rack
#compare letter to word and adjust working word accordingly - while getting user input
# word.length.times do |i|
#   if letter == word_array[i]
#     print "#{letter} "
#     working_word_game[i] = "#{letter}"
#   end
# end

# puts
# print word_array
# puts
# print working_word_game
# puts

#counter!
# if word_array.include?(letter) == false
#   counter -= 1
# end
