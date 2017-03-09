module Omniauth
  module Mock
    def auth_mock(user)
      OmniAuth.config.mock_auth[:strava] = OmniAuth::AuthHash.new(
        'provider' => 'strava',
        'uid'      => user.uid,
        'info'     => {
          'name'  => "#{user.firstname} #{user.lastname}",
          'email' => user.email
        },
        'credentials' => {
          'token' => SecureRandom.uuid,
          'expires' => false
        },
        'extra' => {
          'raw_info' => {
            'firstname' => user.firstname,
            'lastname' => user.lastname
          }
        }
      )
    end

    def auth_failure_mock
      OmniAuth.config.mock_auth[:strava] = :invalid_credentials
    end
  end

  module SessionHelpers
    def sign_in(user)
      auth_mock(user)
      visit '/auth/strava'
    end
  end
end

RSpec.configure do |config|
  config.include Omniauth::Mock
  config.include Omniauth::SessionHelpers, type: :feature
end

OmniAuth.config.test_mode = true
