require 'rails_helper'


describe 'creating restaurants' do

	context 'a valid restaurant' do 
		
		it 'prompts the user to fill out a form, then displays the new restaurant' do

			visit '/restaurants'	
			click_link 'Add a restaurant'

			fill_in 'Name', with: 'KFC'
			click_button 'Create Restaurant'

			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
		end	
	end

	context 'an invalid restaurant, due to uncapitalized name that is too short' do
		it 'shows an error' do

			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'ab'

			click_button 'Create Restaurant'
			expect(page).not_to have_css 'h2', text: 'ab'
			expect(page).to have_content 'errors'
		end
	end
end	
