# Quiz Mode controller.
class QuizModeController < ApplicationController
  before_action :set_question, only: [:next]
  after_action :clean_session, only: [:complete]

  def start_quiz
    session[:answers] = {}
    session[:questions] = []
    session[:question_index] = 0

    questions = Question.all
    questions.each do |question|
      session[:questions] << question.id
    end

    @question = questions.first
    render 'quiz'
  end

  def complete
    query = Question.all
    total_correct = 0
    answers_hash = session[:answers]

    puts("answers_hash: #{answers_hash}")

    @questions = []
    query.each do |question|
      question.actual_answer = answers_hash[question.id.to_s]
      question.check_answer
      total_correct += 1 if question.is_correct
      @questions << question
      puts(question.actual_answer)
    end
    session[:correct_answers_count] = total_correct
    render 'complete'
  end

  def quiz
    current_question_index = session[:question_index].to_i
    question_id = session[:questions][current_question_index]
    @question = Question.find(question_id)
    render 'quiz'
  end

  def next
    # store answer
    answers_hash = session[:answers]
    answers_hash[@question.id] = @question.actual_answer
    session[:answers] = answers_hash

    # go to next question
    current_question_index = session[:question_index].to_i
    new_question_index = current_question_index + 1
    session[:question_index] = new_question_index

    if session[:questions].length == new_question_index
      redirect_to quiz_mode_complete_url
    else
      redirect_to quiz_mode_quiz_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    current_question = session[:question_index]
    questions = session[:questions]
    id = questions[current_question]
    @question = Question.find(id)
    @question.actual_answer = question_params[:actual_answer]
  end

  # Never trust parameters from the scary internet, only allow
  # the white list through.
  def question_params
    params.require(:question).permit(:actual_answer)
  end

  def clean_session
    session.delete(:answers)
    session.delete(:questions)
    session.delete(:question_index)
  end
end
