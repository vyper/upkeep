class BikeRepository < Hanami::Repository
  associations do
    belongs_to :user
    has_many :parts
  end

  def add_part(bike, part)
    assoc(:parts, bike).add(part)
  end

  def by_user(user)
    bikes.where(user_id: user.id).call
  end
end
