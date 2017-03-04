module Web::Controllers::Bikes
  class Create
    include Web::Action

    expose :bike

    def call(params)
      @bike = BikeRepository.new.create(params[:bike])

      redirect_to routes.bikes_path
    end
  end
end
