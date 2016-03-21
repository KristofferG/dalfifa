class CommentsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :index, :show]


  def create
    @cup = Cup.find(params[:cup_id])
    @comment = @cup.comments.create(comment_params)
    redirect_to cup_path(@cup)
  end

  def destroy
    @cup = Cup.find(params[:cup_id])
    @comment = @cup.comments.find(params[:id])
    @comment.destroy
    redirect_to cup_path(@cup)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
