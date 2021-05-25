class CommentsController < ApplicationController

	# That's a side-effect of the nesting set up. Each request for a comment has to keep track of the article to which the comment is attached, thus the initial call to the find method of the Article model to get the article in question
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)		#this calls the show action of the ArticlesController which in turn renders the show.html.erb template
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end