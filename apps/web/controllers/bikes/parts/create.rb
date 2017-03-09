module Web::Controllers::Bikes::Parts
  class Create
    include Web::Action

    before :authenticate!

    params do
      required(:part).schema do
        required(:name).filled
        required(:type_id).filled
      end
    end

    expose :part, :bike, :types

    def call(params)
      @bike = BikeRepository.new.find(params[:bike_id])
      @types = Hash[PartTypeRepository.new.all.map { |type| [type.name, type.id] }]

      if params.valid?
        @part = BikeRepository.new.add_part(@bike, params[:part])

        redirect_to routes.bike_parts_path(@bike.id)
      end
    end
  end
end
