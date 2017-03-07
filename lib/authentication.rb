module Authentication
  def self.included(action)
    action.class_eval do
      expose :current_user
    end
  end

private

  def authenticated?
    !current_user.nil?
  end

  def current_user
    @current_user ||= UserRepository.new.find(session[:current_user])
  end
end
