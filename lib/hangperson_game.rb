class HangpersonGame
  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word)
    self.word = word
    self.guesses = ""
    self.wrong_guesses = ""
  end

  def guess letter
    raise ArgumentError unless letter =~ /^[[:alpha:]]$/
    letter = letter.downcase
    guessed_letters = word.include?(letter) ? guesses : wrong_guesses
    guessed_letters.include?(letter) ? false : guessed_letters << letter
  end

  def word_with_guesses
    result = ""
    word.chars do |letter|
      result << ( guesses.include?(letter) ? letter : "-" )
    end
    result
  end

  def check_win_or_lose
    case
    when word_with_guesses == word
      :win
    when wrong_guesses.size >= 7
      :lose
    else
      :play
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
end
