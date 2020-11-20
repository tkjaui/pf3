class Service < ApplicationRecord
  belongs_to :user, optional: true
  attachment :image

  with_options presence: true do
    validates :company
    validates :device
    validates :price
    validates :days
    validates :body
    validates :problem
    validates :result
  end
end
