#Word Guess Game - Sara Stiltner and Lily Sky

#array of game words
library = ["apples", "orange", "marker", "papers"]

word = library.sample
word_array = word.chars
puts word_length = word_array.length

working_word = []
word_length.times do |i|
  working_word << "_"
end

print working_word # see if it's working ok
puts
puts word # see if it's working ok

counter = 4 #perhaps adjust to number of unique letters in the word, we want a gameover message

guesses = [] #wrong guesses

#begin game, 5 times arbitrary for now
5.times do
  print "Guess a letter: "
  letter = gets.chomp.downcase.to_s

  puts "\n \n"

  #compare letter to word and adjust working word accordingly
  #must be valid letter not one already given
  word_length.times do |i|
    if letter == word_array[i]
      print "#{letter} "
      working_word[i] = "#{letter}"
    end
  end

  #if incorrect, keep in guesses array
  if word_array.include?(letter) == false
    guesses.push(letter)
  end

  puts
  print word_array
  puts
  print working_word
  puts

  #visually see letters already tried
  guesses.each do |letter|
    print "#{letter}"
  end

  puts

  #display current progress with working word
  working_word.each do |letter|
    print "#{letter}"
  end
  puts
  puts word

  #counter!
  if word_array.include?(letter) == false
    counter -= 1
  end

  if word_array.include?(letter) == false && counter == 0
    puts "you die"
    exit
  elsif working_word.include?("_") == false
    puts "Hooray, you won!"
    exit
  elsif word_array.include?(letter) == true
    puts "you did right"
  end

  puts "\n" + counter.to_s
end
#
#
#
#
