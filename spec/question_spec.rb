require 'rails_helper'


############View/ Feature Test 
describe 'question show page' do 
	it 'shows the individual question' do 
		visit '/questions/1'
		expect(page).to have_content("Tags")
	end 

	# it 'should display a link to the user who posted' do 
	# 	visit '/questions/1'
	# end 
end 
# ################## Controller Test 
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

# ###################### Model Test
describe Question do 
	let(:question) {Question.new(title: "Test Question", description: "blah blah blah wah wah ")}
	it 'should have a title' do 
		question.save
		expect(question.title).to eq("Test Question")
	end	 
end 