require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

# Allows the question to check itself for correctness
module AnswerChecker
  def check_answer
    formatted1 = nums_to_word(answer)
    formatted2 = nums_to_word(actual_answer)
    @is_correct = formatted1&.strip == formatted2&.strip
  end

  def nums_to_word(string)
    ren = /(\d+)/
    return string.gsub(ren, string[ren, 1].to_i.in_words) if string =~ ren
    string
  end
end
