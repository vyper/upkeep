module Web::Controllers::Bikes
  class Index
    include Web::Action

    before :authenticate!

    expose :bikes

    def call(params)
      @bikes = BikeRepository.new.by_user(current_user)
    end
  end
end
