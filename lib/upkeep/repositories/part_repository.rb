class PartRepository < Hanami::Repository
  associations do
    belongs_to :bike
    belongs_to :type, as: :part_type
  end

  def find_by_bike_id(bike_id)
    parts
      .where(bike_id: bike_id)
      .call
  end
end
