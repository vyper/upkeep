module Web::Controllers::Bikes
  class Create
    include Web::Action

    expose :bike

    def call(params)
      @bike = BikeRepository.new.create(params[:bike])

      redirect_to '/bikes'
    end
  end
end
