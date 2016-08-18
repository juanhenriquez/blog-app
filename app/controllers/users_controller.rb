class UsersController < ApplicationController

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
        @user = User.find(params[:id])
    end

    # POST users/:id/
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            flash[:success] = "Your account was successfully updated!"
            redirect_to articles_path
        else
            render 'edit'
        end

    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password);
    end

end
