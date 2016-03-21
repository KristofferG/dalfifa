class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def created
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to user, alert: "Inloggad"
    else
      redirect_to login_url, alert:"Felaktigt kombination av användarnamn och lösenord. Kontakta Maxkungen"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Du är utloggad!"
  end
end
