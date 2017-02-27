class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @location = Location.find_by_id(params[:id])
    @destination = Destination.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  user = User.new(user_params)
  if user.save
    login(user)
    redirect_to user

    else
     user.errors.full_messages.each do |message|
       flash[:error] = message
     end
     redirect_to new_user_path
    end
  end

    def edit
      user_id = params[:id]
      @user = User.find_by_id(user_id)
      render :edit
    end

    def update
      user_id = params[:id]
      @user = User.find(user_id)
      if @user.update_attributes(user_params)
        flash[:notice] = "Updated successfully."
        redirect_to @user
      else
          flash[:error] = "nondescriptive unhelpful flash"

        redirect_to edit_user_path(@user)
      end
    end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
