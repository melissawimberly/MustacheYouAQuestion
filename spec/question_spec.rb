require 'rails_helper'

describe 'question show page' do 
	it 'shows the individual question' do 
		visit '/questions/1'
		expect(page).to have_content("Tags")
	end 
end 