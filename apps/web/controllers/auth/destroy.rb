module Web::Controllers::Auth
  class Destroy
    include Web::Action

    def call(params)
      session.delete :current_user
      redirect_to routes.root_path
    end
  end
end
