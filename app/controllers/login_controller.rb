class LoginController < ApplicationController
  def login
    @user_role = Users.where("username=? AND password=?",params[:username],params[:password]).pluck(:role).join(" ")
    if @user_role == ""
      puts "empty"
      render :status => :unauthorized
      
    else
      puts "data is there"
    end
    puts @user_role
  end
end
