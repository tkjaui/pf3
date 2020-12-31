# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :score, presence: true
end
