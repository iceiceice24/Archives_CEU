class UsersController < ApplicationController
    def new
        @user = User.new
    end
  
    def show
        @user = User.find(params[:id])
    end
  
    def home
        @users = User.all
    end
      
  
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = "User successfully created."
          redirect_to root_path
        else
          render 'new'
        end
    end
  
    def edit
        #@user = current_user             
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:notice] = "User successfully deleted"      
        redirect_to root_path
    end
  
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        flash[:notice] = "User successfully updated"
        redirect_to root_path  
      else
        render :edit, status: :unprocessable_entity                  
      end
    end
  
    private      
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
    def find_user
        @user = User.find_by(id: params[:id])
    end

end
