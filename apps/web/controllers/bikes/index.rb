module Web::Controllers::Bikes
  class Index
    include Web::Action

    expose :bikes

    def call(params)
      @bikes = BikeRepository.new.all
    end
  end
end
