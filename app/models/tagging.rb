# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :tag, dependent: :delete
  belongs_to :entry, dependent: :delete
end
