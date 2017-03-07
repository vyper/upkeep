require 'hanami/interactor'

class Authenticator
  include Hanami::Interactor

  expose :user

  def initialize(params, repository: UserRepository.new)
    @params     = params
    @repository = repository
  end

  def call
    @user = @repository.find_by_provider_and_uid(provider, uid)
    @user = @repository.create(user_attributes) if @user.nil?
  end

  private

  def user_attributes
    {
      firstname: omniauth_raw_info['firstname'],
      lastname: omniauth_raw_info['lastname'],
      email: omniauth['info']['email'],
      provider: provider,
      uid: uid,
      code: @params[:code]
    }
  end

  def omniauth
    @params.env['omniauth.auth']
  end

  def omniauth_raw_info
    omniauth['extra']['raw_info']
  end

  def provider
    omniauth['provider']
  end

  def uid
    omniauth['uid']
  end
end
