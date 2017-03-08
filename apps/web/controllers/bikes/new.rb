module Web::Controllers::Bikes
  class New
    include Web::Action

    before :authenticate!

    def call(params)
    end
  end
end
