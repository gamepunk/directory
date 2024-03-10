# frozen_string_literal: true

class User < ApplicationRecord
  before_create :set_default_admin

  has_many :entries
  has_many :comments
  has_many :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  paginates_per 50

  private
  def set_default_admin
    self.admin = (email == 'codepunk@qq.com')
  end
end
