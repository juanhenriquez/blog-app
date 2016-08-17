class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # GET - Show all the articles.
    def index
        @articles = Article.all
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
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        
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

end