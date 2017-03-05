module Web::Controllers::Bikes::Parts
  class New
    include Web::Action

    expose :bike, :types

    def call(params)
      @bike = BikeRepository.new.find(params[:bike_id])
      @types = Hash[PartTypeRepository.new.all.map { |type| [type.name, type.id] }]
    end
  end
end
