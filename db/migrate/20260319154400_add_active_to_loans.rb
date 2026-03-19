class AddActiveToLoans < ActiveRecord::Migration[8.1]
  def change
    add_column :loans, :active, :boolean, default: true, null: false
  end
end
