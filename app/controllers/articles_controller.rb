class ArticlesController < ApplicationController

def index
    @article = Article.new
	@articles = Article.all
end

def show
    @article = Article.find(params[:id])
end

def new
end

def showall
	    @articles = Article.order('created_at DESC').page(params[:page]).per(10)
end

def create

	@article = Article.new(article_params)
	@article.save

	respond_to do |format|
    if @article.save
      format.html { redirect_to @article }
      format.js   
  	end

end

end

private 
def article_params
    params.require(:article).permit(:title, :text)
end



end
