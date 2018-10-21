class AddPriceMinToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :price_min, :integer
  end
end
