class Service < ApplicationRecord
  belongs_to :user
  attachment :image
end
