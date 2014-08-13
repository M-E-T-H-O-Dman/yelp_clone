require 'rails_helper'

describe 'restaurants' do

	context 'no restaurants have been added' do 

		it 'should diplay a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end	
	end	

	context 'when restaurants have been added' do 
		before(:each) do 

			Restaurant.create(name: 'McDonalds')
		end	
		it 'should display them' do 
			visit '/restaurants'
			expect(page).to have_content 'McDonalds'
		end
	end	

	describe 'creating restaurants' do
		
		it 'prompts the user to fill out a form, then displays the new restaurant' do

			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'Name', with: 'KFC'
			click_button 'Create Restaurant'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
		end	
	end	

	describe 'editing restaurants' do
		before(:each) do 
			Restaurant.create(name: 'KFC')
		end
		it 'prompts the user to fill out a form, then displays the new restaurant' do

			visit '/restaurants'
			click_link 'Edit KFC'

			fill_in 'Name', with: 'Kentucky Fried Chicken'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Kentucky Fried Chicken'
			expect(current_path).to eq '/restaurants'
		end		
	end

	describe 'delete restaurants' do 
		before(:each) do 
			Restaurant.create(name: 'KFC')
		end
		it 'removes restaurants when user clicks a delete link' do 
			visit '/restaurants'
			click_link 'Delete KFC'

			expect(page).not_to have_content('KFC')
			expect(page).to have_content('Restaurant deleted successfully')
		end		
	end
end	
