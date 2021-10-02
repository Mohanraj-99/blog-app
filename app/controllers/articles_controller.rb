class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit,:update,:destroy,:show] 

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(get_allowed_params)
        if @article.save
            flash[:notice] = "The Article created successfully"
            redirect_to article_path(@article)
        else
            render :new
        end
    end
        
    def edit
    end

    def update
        if @article.update(get_allowed_params)
            flash[:notice] = "The Article updated successfully"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    
    def index
        @articles = Article.all
    end
    
    def show
    end

    def destroy
        @article.destroy()
        flash[:notice] = "The Article was deleted Successfully"
        redirect_to articles_path
    end

    private 
        def set_article
            @article = Article.find(params[:id])
        end
        
        def get_allowed_params
            params.require(:article).permit(:title,:description)    
        end
end