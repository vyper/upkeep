module Web::Controllers::Bikes
  class Destroy
    include Web::Action

    before :authenticate!

    expose :bike

    def call(params)
      @bike = BikeRepository.new.delete(params[:id])
    end
  end
end
