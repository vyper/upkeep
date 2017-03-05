module Web::Controllers::Bikes::Parts
  class Edit
    include Web::Action

    expose :part, :bike, :types

    def call(params)
      @bike = BikeRepository.new.find(params[:bike_id])
      @types = Hash[PartTypeRepository.new.all.map { |type| [type.name, type.id] }]
      @part = PartRepository.new.find(params[:id])
    end
  end
end
