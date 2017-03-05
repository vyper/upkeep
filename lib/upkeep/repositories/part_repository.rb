class PartRepository < Hanami::Repository
  associations do
    belongs_to :bike
    belongs_to :type, as: :part_type
  end
end
