require 'features_helper'

RSpec.describe 'Add a bike' do
  after do
    BikeRepository.new.clear
  end

  it 'can create a new bike' do
    visit '/bikes/new'

    within 'form#bike-form' do
      fill_in 'Name',  with: 'New bike'

      click_button 'Create'
    end

    expect(current_path).to eq('/bikes')
    expect(page).to have_content('New bike')
  end
end
