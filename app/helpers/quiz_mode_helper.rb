# Generated
require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

module QuizModeHelper
  # return the number of correct answers
  def process_answers(answers, questions)
    correct_answers = 0
    questions.each do |question|
      question.actual_answer = answers[question.id]
      correct_answers += 1 if check_answer(question)
    end
    correct_answers
  end

  def check_answer(question)
    formatted1 = nums_to_word(question.answer)
    formatted2 = nums_to_word(question.actual_answer)
    formatted1 == formatted2
  end

  def nums_to_word(string)
    ren = /(\d+)/
    return string.gsub(ren, string[ren, 1].to_i.in_words) if string[ren]
    string
  end

  # Convert number to words
end