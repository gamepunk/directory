# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings, dependent: :delete_all
  has_many :entries, through: :taggings
end