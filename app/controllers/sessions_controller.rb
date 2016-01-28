class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def new
    redirect_to current_user if signed_in?
  end

  def create
    user=User.find_by(email:params[:session][:email].downcase)
    if user
      if user.authenticate(params[:session][:password])
      sign_in user
      #redirect_to user
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    else
      flash.now[:error] = 'User does not exist'
      @singnow=true
      render 'new'
      #redirect_to signup_url
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
