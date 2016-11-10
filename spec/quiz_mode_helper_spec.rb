describe QuizModeHelper do

  subject(:module) do
    sut = Object.new
    sut.extend(QuizModeHelper)
  end

  let(:answer_exact) do
    question = Question.new
    question.answer = 'exact'
    question.actual_answer = 'exact'
    question
  end

  let(:answer_is_number) do
    question = Question.new
    question.answer = '5'
    question.actual_answer = 'five'
    question
  end

  let(:answer_is_word_number) do
    question = Question.new
    question.answer = 'five'
    question.actual_answer = '5'
    question
  end

  let(:answer_contains_number) do
    question = Question.new
    question.answer = 'Give me 5 and four'
    question.actual_answer = 'Give me five and four'
    question
  end

  describe '#check_answer' do
    it 'returns true if exact match' do
      expect(subject.check_answer(answer_exact)).to be_truthy
    end

    it 'returns true if numeric compared to word' do
      expect(subject.check_answer(answer_is_number)).to be_truthy
    end

    it 'returns true if word compared to number' do
      expect(subject.check_answer(answer_is_word_number)).to be_truthy
    end

    it 'returns true if word to number, vice versa' do
      expect(subject.check_answer(answer_is_word_number)).to be_truthy
    end
  end

  describe '#nums_to_word' do
    it 'converts exact number to word' do
      expect(subject.nums_to_word('1')).to eq('one')
    end
    it 'converts contained number to word' do
      expect(subject.nums_to_word('one 1 thousand')).to eq('one one thousand')
    end
  end

end # class
