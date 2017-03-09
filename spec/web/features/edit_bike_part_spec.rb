require 'features_helper'

RSpec.describe 'Edit a bike part' do
  let(:repositories) do
    {
      users:      UserRepository.new,
      bikes:      BikeRepository.new,
      part_types: PartTypeRepository.new,
      parts:      PartRepository.new
    }
  end

  before do
    repositories.each { |_, repo| repo.clear }

    @user = repositories[:users].create(firstname: 'Leonardo', lastname: 'Saraiva', email: 'vyper@maneh.org', provider: 'strava', uid: SecureRandom.uuid, code: SecureRandom.uuid)
    @bike = repositories[:bikes].create(name: 'Bike name', user_id: @user.id)
    @rear_tire_type = repositories[:part_types].create(name: 'Rear tire')
    @front_tire_type = repositories[:part_types].create(name: 'Front tire')
    @part = repositories[:bikes].add_part(@bike, name: 'Part name', type_id: @rear_tire_type.id)
    sign_in(@user)
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
