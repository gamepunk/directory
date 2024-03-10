# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :taggings, dependent: :delete_all
  has_many :tags, through: :taggings
  has_many :votes, dependent: :delete_all

  has_rich_text :content

  enum status: %i[ drafted published ]

  scope :recent, -> { order(created_at: :desc).limit(25) }

  validates_presence_of :title

  def drafted
    Entry.where(status: 0)
  end

  def published
    Entry.where(status: 1)
  end
  def upvotes_count
    votes.count
  end

end