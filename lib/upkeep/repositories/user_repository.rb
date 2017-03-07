class UserRepository < Hanami::Repository
  def find_by_provider_and_uid(provider, uid)
    users.where(provider: provider, uid: uid).first
  end
end
