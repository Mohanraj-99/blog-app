class ArticlesController < ApplicationController

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
        
    # def edit
    #     @article = Article.find(:id)
    #     @article
    # end

    # def update
    #     article = Article.new()
    #     article.save()
    # end
    
    def index
        Article.all
    end
    
    def show
        @article = Article.find(params[:id]) 
    end

    # def destroy
    #     @article = Article.find(params[:id])
    #     @article.destroy()
    # end

    private 
    def get_allowed_params
        params.require(:article).permit(:title,:description)    
    end
end