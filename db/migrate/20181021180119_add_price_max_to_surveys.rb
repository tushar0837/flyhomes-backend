class AddPriceMaxToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :price_max, :integer
  end
end
