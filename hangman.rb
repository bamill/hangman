#!/usr/bin/env ruby

class Hangman
  def initialize
    @file = File.open("hella_words.txt", "r")
    @content = @file.readlines.sort! { |x,y| x.length <=> y.length }
    set_word
    set_user_word
  end
  def set_word difficulty={}
    difficulty[:level] ||= 'normal'
    third = @content.length / 3
    two_thirds = third * 2
    @word = case difficulty[:level]
            when 'normal' then @content[rand(third...two_thirds)]
            when 'easy' then @content[rand(0...third)]
            when 'difficult' then @content[rand(two_thirds...@content.length)]
            end
  end
  def set_user_word
    @user_word ||= @word.chars.map { |x| "_" }.join("")[0..-2]
  end
  def get_word
    return @word
  end
  def get_user_word
    return @user_word
  end
  def set_num_guesses
    @num_guess ||= case difficulty[:level]
               when 'normal' then 6
               when 'easy' then 8
               when 'difficult' then 3
               end
  end
  def get_num_guesses
    return @num_guess
  end
  def set_guesses guess={}
    @guesses ||= 
end

hangman = Hangman.new
puts hangman.get_word
puts hangman.get_user_word
