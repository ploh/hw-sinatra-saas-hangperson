class HangpersonGame
  attr_accessor :word, :guesses, :wrong_guesses

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
  end

  def guess(letter)
    raise ArgumentError if letter !~ /^[[:alpha:]]$/
    letter = letter.downcase
    if @word.include? letter
      unless @guesses.include? letter
        @guesses << letter
      else
        return false
      end
    else
      unless @wrong_guesses.include? letter
        @wrong_guesses << letter
      else
        return false
      end
    end
    true
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
