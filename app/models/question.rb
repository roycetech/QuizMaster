#
class Question < ApplicationRecord
  include AnswerChecker

  attr_accessor :actual_answer, :is_correct

  validates :content, presence: true
  validates :answer, presence: true
end
