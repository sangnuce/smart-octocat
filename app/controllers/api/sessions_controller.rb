class Api::SessionsController < Api::BaseApiController
  include Devise::Controllers::SignInOut
  skip_before_action :authenticate_user!

  def create
    user = User.where("lower(email) = ?", params[:email].downcase).first
    if user && user.valid_password?(params[:password])
      sign_in "user", user
      response_success({message: "Login success", user: current_user, session: user_session})
    else
      response_fail({message: "Can't login"})
    end
  end
end
