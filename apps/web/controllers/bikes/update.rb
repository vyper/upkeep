module Web::Controllers::Bikes
  class Update
    include Web::Action

    before :authenticate!

    params do
      required(:bike).schema do
        required(:name).filled
        required(:type).filled(included_in?: Bike::TYPES.keys)
      end
    end

    expose :bike

    def call(params)
      if params.valid?
        @bike = BikeRepository.new.update(params[:id], params[:bike])

        redirect_to routes.bikes_path
      else
        @bike = BikeRepository.new.find(params[:id])
      end
    end
  end
end
