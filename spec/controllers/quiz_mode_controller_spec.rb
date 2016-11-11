# Integration Testing
describe QuizModeController do

  describe 'starting quiz' do
    it 'initializes answers to empty' do
      get(:start_quiz)
      expect(@request.session[:answers]).to eq({})
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
      post :next, question: { actual_answer:  'Six' }

        response.should redirect_to(quiz_mode_quiz_path)


      expect('no error').to eq('no error')
    end
  end
end
