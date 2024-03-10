# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_entry
  before_action :authenticate_user!

  # POST /comments or /comments.json
  def create
    @comment = @entry.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!

    redirect_to @entry
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = @entry.comments.find(params[:id])
    @comment.destroy!

    redirect_to @entry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
