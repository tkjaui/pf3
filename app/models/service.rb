# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :user, optional: true
  attachment :image
  has_many :reviews, dependent: :destroy

  with_options presence: true do
    validates :company
    validates :device
    validates :price
    validates :days
    validates :body
    validates :problem
    validates :result
  end

  def avg_score
    if reviews.empty?
      0.0
    else # emptyじゃなければ下記を返す
      reviews.average(:score).round(1).to_f # 小数点0.1まで記載、四捨五入
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end
end
