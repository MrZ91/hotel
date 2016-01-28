class UsersController < ApplicationController
  include SessionsHelper

  def create #post
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def new #get
    if signed_in?
    @user=User.new()
    else
      render 'show'
    end
  end

  def edit #get

  end

  def show #get
    @user=current_user
  end

  def update #patch/put

  end

  def destroy #delete

  end

    private

   def user_params
   params.require(:user).permit(:name, :email, :password,
                               :password_confirmation)
   end
end
