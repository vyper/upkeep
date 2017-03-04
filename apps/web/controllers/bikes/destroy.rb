module Web::Controllers::Bikes
  class Destroy
    include Web::Action

    expose :bike

    def call(params)
      @bike = BikeRepository.new.delete(params[:id])
    end
  end
end
