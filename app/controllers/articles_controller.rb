class ArticlesController < ApplicationController

    # GET - Show new form for create a artice.
    def new
        @article = Article.new
    end
    
    # POST - Create a new article.
    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.save
        redirect_to articles_show(@article)
    end
    
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end

end