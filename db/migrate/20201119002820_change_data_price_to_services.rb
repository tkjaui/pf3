# frozen_string_literal: true

class ChangeDataPriceToServices < ActiveRecord::Migration[6.0]
  def change
    change_column :services, :price, :string
  end
end
