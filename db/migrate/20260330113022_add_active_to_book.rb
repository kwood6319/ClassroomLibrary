class AddActiveToBook < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :active, :boolean, default: true
  end
end
