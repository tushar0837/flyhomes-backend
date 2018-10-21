class AddPlacesToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :places, :text
  end
end
