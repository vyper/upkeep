class UserRepository < Hanami::Repository
  associations do
    has_many :bikes
  end

  def find_by_provider_and_uid(provider, uid)
    users.where(provider: provider, uid: uid).first
  end

  def add_bike(user, bike)
    assoc(:bikes, user).add(bike)
  end
end
