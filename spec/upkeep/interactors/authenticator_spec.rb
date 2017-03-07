require 'spec_helper'

RSpec.describe Authenticator do
  let(:repository) { double(:repository) }
  let(:provider) { 'strava' }
  let(:firstname) { 'Leonardo' }
  let(:lastname) { 'Saraiva' }
  let(:email) { 'vyper@maneh.org' }
  let(:uid) { 123456 }
  let(:code) { SecureRandom.uuid }
  let(:user) { double(:user) }
  let(:params) do
    OpenStruct.new(
      code: code,
      env: {
        'omniauth.auth' => {
          'provider' => provider,
          'uid'      => uid,
          'info'     => {
            'name'  => "#{firstname} #{lastname}",
            'email' => email
          },
          'credentials' => {
            'token' => SecureRandom.uuid,
            'expires' => false
          },
          'extra' => {
            'raw_info' => {
              'firstname' => firstname,
              'lastname' => lastname
            }
          }
        }
      }
    )
  end

  subject { described_class.new(params, repository: repository) }

  it 'creates a new user when does not exist' do
    user_attributes = { firstname: firstname, lastname: lastname, email: email, provider: provider, uid: uid, code: code }

    allow(repository).to receive(:find_by_provider_and_uid).with(provider, uid).and_return(nil)
    expect(repository).to receive(:create).with(user_attributes)

    subject.call
  end

  it 'use an existent user when uid and provider match' do
    allow(repository).to receive(:find_by_provider_and_uid).with(provider, uid).and_return(user)
    expect(repository).to_not receive(:create)
  end
end
