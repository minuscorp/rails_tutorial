class AccountConfirmationController < ApplicationController

  def edit
    @user = User.find_by!(confirmation_token: params[:id])
    @user.confirmed = true
    if @user.save!(validate: false)
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      redirect_to root_url
      flash[:error] = "Something went wrong, please try again later."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password,
                                 :password_confirmation)
  end
end
