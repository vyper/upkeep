module Web::Controllers::Bikes
  class Create
    include Web::Action

    params do
      required(:bike).schema do
        required(:name).filled
        required(:type).filled(included_in?: Bike::TYPES.keys)
      end
    end

    expose :bike

    def call(params)
      if params.valid?
        @bike = BikeRepository.new.create(params[:bike])

        redirect_to routes.bikes_path
      end
    end
  end
end
