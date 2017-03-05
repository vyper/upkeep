module Web::Controllers::Bikes::Parts
  class Index
    include Web::Action

    expose :bike, :parts

    def call(params)
      @bike = BikeRepository.new.find(params[:bike_id])
      @parts = PartRepository.new.find_by_bike_id(params[:bike_id])
    end
  end
end
