class Admin::UsersController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @users = User.all.page(params[:page]).per(10)
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
