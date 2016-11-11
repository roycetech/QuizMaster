#
describe Question do
  context 'is invalid' do
    specify 'when no content' do
      subject.answer = 'super!'
      expect(subject.valid?).to be false
    end
    specify 'when no answer' do
      subject.content = 'How awesome?'
      expect(subject.valid?).to be false
    end
  end

  it 'is valid with all the required attributes' do
    subject.content = 'How awesome?'
    subject.answer = 'super!'
    expect(subject.valid?).to be true
  end
end
