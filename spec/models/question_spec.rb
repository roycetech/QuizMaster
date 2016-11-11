#
describe Question do
  let(:question) { subject }

  context 'is invalid' do
    specify 'when no content' do
      question.answer = 'super!'
      expect(question).not_to be_valid
    end
    specify 'when no answer' do
      question.content = 'How awesome?'
      expect(question).not_to be_valid
    end

    it 'raises an error when saved without required attributes' do
      expect { question.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  it 'is valid with all the required attributes' do
    question.content = 'How awesome?'
    question.answer = 'super!'
    expect(question).to be_valid
  end
end
