# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate
  def new
    @member = Member.new
  end

  def create
    @member = Member.find_by(email: params[:session][:email].downcase)
    if @member && @member.password == params[:session][:password]
      # Log the user in and redirect to the user's show page.
      @member.token = SecureRandom.hex
      response.headers['X-AUTH-TOKEN'] = @member.token
      session[:auth_token] = @member.token
      @member.save
      log_in @member
      redirect_to blogapp_index_path
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
