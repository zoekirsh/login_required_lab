class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if params[:name] == nil || params[:name] == ""
      redirect_to root_path
    else
      session[:name] = params[:name]
      redirect_to welcome_path
    end
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end
  
  def welcome
  end

  private 

  def require_login
    return head(:forbidden) unless session.include? :name
  end
end
