module Web::Controllers::Auth
  class Success
    include Web::Action

    def call(params)
      result = Authenticator.new(params).call

      session[:current_user] = result.user.id

      redirect_to routes.root_path
    end
  end
end
