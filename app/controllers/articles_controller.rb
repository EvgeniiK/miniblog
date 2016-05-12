class ArticlesController < ApplicationController

def index
    @articles = Article.order('created_at DESC').page(params[:page]).per(10)
    @article = Article.new

end

def show
    @article = Article.find(params[:id])
end

def new
end

def create
	@article = Article.new(article_params)

 	@article.save
 	redirect_to articles_path
end

private 
def article_params
    params.require(:article).permit(:title, :text)
end



end
