class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'コメントを投稿しました！'
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.now[:notice] = 'コメントを削除しました！'
    respond_to do |format|
      format.html {redirect_to topic_path(@topic), notice: 'コメントを削除しました！' }
      format.js {render :index }
    end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
