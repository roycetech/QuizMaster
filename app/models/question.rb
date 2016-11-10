#
class Question < ApplicationRecord
  include AnswerChecker

  attr_accessor :actual_answer, :is_correct
end
