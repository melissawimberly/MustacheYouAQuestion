require 'rails_helper'
describe Question do
  let(:question) {Question.new(title: "Test Question", description: "blah blah blah wah wah ")}
  it 'should have a title' do
    question.save
    expect(question.title).to eq("Test Question")
  end
end
