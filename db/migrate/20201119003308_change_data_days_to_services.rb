class ChangeDataDaysToServices < ActiveRecord::Migration[6.0]
  def change
    change_column :services, :days, :string
  end
end
