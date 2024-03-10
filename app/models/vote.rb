# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :user_id, uniqueness: { scope: :entry_id, message: 'has already voted on this entry' }
end
