module Web::Controllers::Bikes
  class Update
    include Web::Action

    expose :bike

    def call(params)
      @bike = BikeRepository.new.update(params[:id], params[:bike])

      redirect_to routes.bikes_path
    end
  end
end
