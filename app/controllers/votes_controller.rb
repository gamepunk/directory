# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :set_entry
  before_action :authenticate_user!

  def upvote
    existing_vote = current_user.votes.find_by(entry_id: @entry.id)

    # 判断是否已经投票
    if existing_vote
      existing_vote.destroy
    else
      Vote.create(user: current_user, entry: @entry)
    end
    redirect_to @entry
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

end
