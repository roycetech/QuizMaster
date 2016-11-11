describe AnswerChecker do
  subject do
    sut = Question.new
    sut.extend(QuizModeHelper)
    sut
  end

  let(:answer_exact) do
    subject.answer = 'exact'
    subject.actual_answer = 'exact'
    subject
  end

  let(:answer_is_number) do
    subject.answer = '5'
    subject.actual_answer = 'five'
    subject
  end

  let(:answer_is_word_number) do
    subject.answer = 'five'
    subject.actual_answer = '5'
    subject
  end

  let(:answer_contains_number) do
    subject.answer = 'Give me 5 and four'
    subject.actual_answer = 'Give me five and four'
    subject
  end

  describe '#check_answer' do
    it 'returns true if exact match' do
      expect(answer_exact.check_answer).to be_truthy
    end

    it 'returns true if number compared to word' do
      expect(answer_is_number.check_answer).to be_truthy
    end

    it 'returns true if word compared to number' do
      expect(answer_is_word_number.check_answer).to be_truthy
    end

    it 'returns true if word to number, vice versa' do
      expect(answer_contains_number.check_answer).to be_truthy
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
