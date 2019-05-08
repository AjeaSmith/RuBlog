# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
end
