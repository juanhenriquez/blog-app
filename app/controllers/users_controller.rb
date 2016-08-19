class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :destroy, :show]

    # GET /users
    def index
        @users = User.all
    end

    # GET /users/:id
    def show

    end

    # GET /signup
    def new
        @user = User.new
    end

    # POST /signup
    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Welcome to Blog App #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end

    end

    # GET users/:id/edit
    def edit

    end

    # POST users/:id/
    def update

        if @user.update(user_params)
            flash[:success] = "Your account was successfully updated!"
            redirect_to articles_path
        else
            render 'edit'
        end

    end

    # DELETE users/:id
    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password);
    end

    def set_user
        @user = User.find(params[:id])
    end

end
