module SessionsHelper
    def login(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def logout
      session[:user_id] = nil
      @current_user = nil
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
    !current_user.nil?
    end
end
