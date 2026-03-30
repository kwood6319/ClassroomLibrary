class AddActiveToStudent < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :active, :boolean, default: true
  end
end
