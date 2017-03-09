module Web::Controllers::Bikes
  class Create
    include Web::Action

    before :authenticate!

    params do
      required(:bike).schema do
        required(:name).filled
        required(:type).filled(included_in?: Bike::TYPES.keys)
      end
    end

    expose :bike

    def call(params)
      if params.valid?
        @bike = UserRepository.new.add_bike(current_user, params[:bike])

        redirect_to routes.bikes_path
      end
    end
  end
end
