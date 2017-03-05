require 'features_helper'

RSpec.describe 'Edit a bike' do
  let(:repository) { BikeRepository.new }

  before do
    repository.clear
    @bike = repository.create(name: 'name #1')
  end

  it 'can edit an existent bike' do
    visit "/bikes/#{@bike.id}/edit"

    within 'form#bike-form' do
      fill_in 'Name', with: 'New name'
      select 'Road Bike', from: 'Type'

      click_button 'Update'
    end

    expect(current_path).to eq('/bikes')
    expect(page).to_not have_content('name #1')
    expect(page).to have_content('New name')
  end
end
