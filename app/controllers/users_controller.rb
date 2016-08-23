class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :destroy, :show]
    before_action :require_user_owner, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    # GET /users
    def index
        # @users = User.all
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    # GET /users/:id
    def show
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    # GET /signup
    def new
        @user = User.new
    end

    # POST /signup
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Blog App #{@user.username}"
            redirect_to user_path(@user)
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
        @user = User.find(params[:id])
        @user.destroy
        flash[:danger] = "User and all articles created by the user have been deleted."
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password);
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_user_owner
        if current_user != @user && !current_user.admin?
            flash[:danger] = "You can only edit or delete your own account."
            redirect_to root_path
        end
    end

    def require_admin
        if logged_in? && !current_user.admin?
            flash[:danger] = "Only admin users can perform that action."
            redirect_to root_path
        end
    end

end
