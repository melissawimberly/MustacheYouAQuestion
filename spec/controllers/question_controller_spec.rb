
require 'rails_helper'

describe QuestionsController do
  question = Question.create(title: "How great are Saturdays?", description: "pretty freaking great!")
  params = {id: question.id, question: {title: 'how awesome are Saturdays?'}}
  it 'should change to how awesome are Saturdays?' do
    put :update, params
    expect(question.reload.title).to eq('how awesome are Saturdays?')
  end
end

describe QuestionsController do
  describe 'GET show' do
    it "displays the question" do
      question = Question.create
      get :create
      expect(assigns(:question)).to eq([question])
    end
  end

  it 'renders the show template' do
    get :show
    expect(response).to render_template("show")
  end
end





