require 'features_helper'

RSpec.describe 'Add a bike part' do
  let(:repositories) do
    {
      bikes:      BikeRepository.new,
      part_types: PartTypeRepository.new,
      parts:      PartRepository.new
    }
  end

  before do
    repositories.each(&:clear)

    @bike = repositories[:bikes].create(name: 'Bike name')
    @part_type = repositories[:part_types].create(name: 'Front tire')
  end

  it 'can create a new bike part' do
    visit "/bikes/#{@bike.id}/parts/new"

    within 'form#part-form' do
      fill_in 'Name', with: 'New bike part'
      select 'Front tire', from: 'Type id'

      click_button 'Create'
    end

    expect(current_path).to eq("/bikes/#{@bike.id}/parts")
    expect(page).to have_content('New bike part')
  end
end
