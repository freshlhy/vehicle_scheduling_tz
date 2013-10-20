#encoding: utf-8
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      if current_user.is_a? Admin
        redirect_back_or admins_trips_path
      elsif current_user.is_a? Driver
        if in_trip?(current_user)
          redirect_to '/drivers/tour'
        else
          redirect_to '/drivers/start'
        end
      else
        if in_trip?(current_user)
          redirect_to '/workers/tour'
        else
          redirect_to '/workers/start'
        end
      end
    else
      flash.now[:error] = '*用户名或密码错误!'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
