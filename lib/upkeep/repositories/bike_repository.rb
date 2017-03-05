class BikeRepository < Hanami::Repository
  associations do
    has_many :parts
  end

  def add_part(bike, part)
    assoc(:parts, bike).add(part)
  end
end
