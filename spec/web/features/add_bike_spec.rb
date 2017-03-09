require 'features_helper'

RSpec.describe 'Add a bike' do
  let(:repositories) do
    {
      users: UserRepository.new,
      bikes: BikeRepository.new
    }
  end

  before do
    repositories.each { |_, repo| repo.clear }

    @user = repositories[:users].create(firstname: 'Leonardo', lastname: 'Saraiva', email: 'vyper@maneh.org', provider: 'strava', uid: SecureRandom.uuid, code: SecureRandom.uuid)
    sign_in(@user)
  end

  it 'can create a new bike' do
    visit '/bikes/new'

    within 'form#bike-form' do
      fill_in 'Name', with: 'New bike'
      select 'Road Bike', from: 'Type'

      click_button 'Create'
    end

    expect(current_path).to eq('/bikes')
    expect(page).to have_content('New bike')
  end
end
