require 'features_helper'

RSpec.describe 'Edit a bike part' do
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
    @rear_tire_type = repositories[:part_types].create(name: 'Rear tire')
    @front_tire_type = repositories[:part_types].create(name: 'Front tire')
    @part = repositories[:bikes].add_part(@bike, name: 'Part name', type_id: @rear_tire_type.id)
  end

  it 'can edit an existent bike part' do
    visit "/bikes/#{@bike.id}/parts/#{@part.id}/edit"

    within 'form#part-form' do
      fill_in 'Name', with: 'New name'
      select @front_tire_type.name, from: 'Type id'

      click_button 'Update'
    end

    expect(current_path).to eq("/bikes/#{@bike.id}/parts")
    expect(page).to_not have_content('Part name')
    expect(page).to have_content('New name')
  end
end
