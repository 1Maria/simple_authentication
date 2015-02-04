class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :child_name
      t.string :parent_name
      t.string :email
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
