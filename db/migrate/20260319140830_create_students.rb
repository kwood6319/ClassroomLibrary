class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :school_id
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
