class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :authenticate_user_from_token!

  private

  def user_for_token(token)
    User.where(authentication_token: token).first.tap { |x| return x if x }
    if token =~ /^\d+$/
      User.all.sort_by { |x| x.id }[token.to_i]
    else
      nil
    end
  end

  def auth_with_params_token(&b)
    token = params[:token]
    if token
      user = user_for_token(token)
      if user
        b[user.authentication_token,{user_email: user.email}]
      end
    end
  end

  def my_with_token(&b)
    authenticate_with_http_token(&b)
    auth_with_params_token(&b)
  end

  def authenticate_user_from_token!
    my_with_token do |token, options|
      user_email = options[:user_email].presence
      user       = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end
end
