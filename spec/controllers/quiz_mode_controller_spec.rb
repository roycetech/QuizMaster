# frozen_string_literal: true

# Integration Testing

# rubocop:disable Metrix/BlockLength
describe QuizModeController do
  describe 'starting quiz' do
    it 'initializes answers to empty' do
      get(:start_quiz)
      expect(@request.session[:answers]).to eq({})
    end

    it 'initializes a question instance variable' do
      get(:start_quiz)
      expect(subject.question).not_to be_nil
    end
  end

  describe 'completing quiz' do
    it 'removes session values' do
      get(:start_quiz)
      get(:complete)
      expect(@request.session[:answers]).to be_nil
      expect(@request.session[:questions]).to be_nil
      expect(@request.session[:question_index]).to be_nil
    end
    it 'initializes the questions instance variable for display' do
      get(:start_quiz)
      get(:complete)
      expect(subject.questions).not_to be_nil
    end
  end

  describe 'display a question' do
    it 'stores a question as intance' do
      get(:start_quiz)
      get(:quiz)
      expect(subject.question).not_to be_nil
    end
  end

  describe 'submit an answer' do
    it 'moves to the next question' do
      get :start_quiz
      post :next, question: { actual_answer: 'Six' }
      expect(response).to redirect_to(quiz_mode_quiz_path)
    end
    it 'redirect to completion screen after the last question' do
      get :start_quiz
      post :next, question: { actual_answer: 'Six' }
      post :next, question: { actual_answer: 'Six' }
      # Hard coded double post to consume the two records defined in the
      # generated fixture.
      expect(response).to redirect_to(quiz_mode_complete_path)
    end
  end
end
# rubocop:enable Metrix/BlockLength
