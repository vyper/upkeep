require 'features_helper'

describe 'List bikes' do
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

  it 'shows message when does not exist bikes' do
    visit '/bikes'

    expect(page).to have_content("There aren't bikes yet")
  end

  it 'shows all bikes on page' do
    repositories[:bikes].create(name: 'name #1', user_id: @user.id)
    repositories[:bikes].create(name: 'name #2', user_id: @user.id)

    visit '/bikes'

    within '#bikes' do
      expect(page).to have_css('.bike', count: 2)
    end
  end
end
