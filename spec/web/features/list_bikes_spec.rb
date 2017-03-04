require 'features_helper'

describe 'List bikes' do
  let(:repository) { BikeRepository.new }

  before do
    repository.clear
  end

  it 'shows message when does not exist bikes' do
    visit '/bikes'

    expect(page).to have_content("There aren't bikes yet")
  end

  it 'shows all bikes on page' do
    repository.create(name: 'name #1')
    repository.create(name: 'name #2')

    visit '/bikes'

    within '#bikes' do
      expect(page).to have_css('.bike', count: 2)
    end
  end
end
