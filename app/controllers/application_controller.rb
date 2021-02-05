class ApplicationController < ActionController::Base
    include SessionsHelper
    include Pundit
    before_action :authenticate, :current_user
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index;end
    
    def authenticate
        request.headers['access-token'] = current_member.token if current_member != nil
        if request.headers.include?('access-token') && request.headers['access-token'] == session[:auth_token]
            #render :text => request.headers['access-token']
            puts request.headers['access-token']
            return true
        else
            return head 404
        end
    end


    def current_user
        @current_user = current_member
        return @current_user
    end

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to blogs_path
    end

end
