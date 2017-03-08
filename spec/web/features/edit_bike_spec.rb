require 'features_helper'

RSpec.describe 'Edit a bike' do
  let(:repositories) do
    {
      users: UserRepository.new,
      bikes: BikeRepository.new
    }
  end

  before do
    repositories.each { |_, repo| repo.clear }

    @user = repositories[:users].create(firstname: 'Leonardo', lastname: 'Saraiva', email: 'vyper@maneh.org', provider: 'strava', uid: SecureRandom.uuid, code: SecureRandom.uuid)
    @bike = repositories[:bikes].create(name: 'name #1', user_id: @user.id)
    sign_in(@user)
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
