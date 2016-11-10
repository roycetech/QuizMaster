#
module AnswerChecker
  def check_answer
    formatted1 = nums_to_word(answer)
    formatted2 = nums_to_word(actual_answer)
    @is_correct = formatted1 == formatted2
  end

  def nums_to_word(string)
    ren = /(\d+)/
    return string.gsub(ren, string[ren, 1].to_i.in_words) if string && string[ren]
    string
  end
end
