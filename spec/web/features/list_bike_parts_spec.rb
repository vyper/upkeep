require 'features_helper'

describe 'List bike parts' do
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
  end

  it 'shows message when does not exist bike parts' do
    visit "/bikes/#{@bike.id}/parts"

    expect(page).to have_content("There aren't parts yet")
  end

  it 'shows all bikes on page' do
    repositories[:bikes].add_part(@bike, name: 'Part name #1', type_id: @rear_tire_type.id)
    repositories[:bikes].add_part(@bike, name: 'Part name #2', type_id: @front_tire_type.id)

    visit "/bikes/#{@bike.id}/parts"

    within '#parts' do
      expect(page).to have_css('.part', count: 2)

      expect(page).to have_content('Part name #1')
      expect(page).to have_content('Part name #2')
    end
  end
end
