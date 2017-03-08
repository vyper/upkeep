module Web::Controllers::Bikes
  class Edit
    include Web::Action

    before :authenticate!

    expose :bike

    def call(params)
      @bike = BikeRepository.new.find(params[:id])
    end
  end
end
