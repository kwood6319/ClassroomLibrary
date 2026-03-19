class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :second_name

      t.timestamps
    end
  end
end
