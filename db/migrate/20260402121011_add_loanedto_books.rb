class AddLoanedtoBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :loaned, :boolean, default: false, null: false
  end
end
