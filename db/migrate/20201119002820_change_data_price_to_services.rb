class ChangeDataPriceToServices < ActiveRecord::Migration[6.0]
  def change
    change_column :services, :price, :string
  end
end
