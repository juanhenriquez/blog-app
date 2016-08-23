class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_user_owner, only: [:edit, :update, :destroy]

    # GET - Show all the articles.
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    # GET - Show a single article.
    def show
    end

    # GET - Show new form for create a artice.
    def new
        @article = Article.new
    end

    # POST - Create a new article.
    def create

        # debugger - Stops the server a allows to debug the app.

        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = current_user

        if @article.save
            flash[:success] = "The articles was created successfully."
            redirect_to article_path(@article)
        else
            render :new
        end
    end

    # GET - Show edit form.
    def edit
    end

    # PUT - Edit the article
    def update

        if @article.update(article_params)
            flash[:success] = "The article has been updated."
            redirect_to article_path(@article)
        else
            render :edit
        end
    end

    # DELETE - Delete an article.
    def destroy

        @article.destroy
        flash[:danger] = "The articles was deleted"

        redirect_to articles_path
    end


    private

        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :description)
        end

        def require_user_owner
            if current_user != @article.user && !current_user.admin?
                flash[:danger] = "You can only edit or delete your own articles."
                redirect_to articles_path
            end
        end

end
