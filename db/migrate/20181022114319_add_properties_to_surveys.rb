class AddPropertiesToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :properties, :string
  end
end
