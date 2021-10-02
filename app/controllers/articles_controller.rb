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
        
    def edit
        @article = Article.find(params[:id]) 
    end

    def update
        @article = Article.find(params[:id])
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
        @article = Article.find(params[:id]) 
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy()
        flash[:notice] = "The Article was deleted Successfully"
        redirect_to articles_path
        # if @article.destroy()
        
        # else

        # end
    end

    private 
    def get_allowed_params
        params.require(:article).permit(:title,:description)    
    end
end