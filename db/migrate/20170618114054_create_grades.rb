class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.float :value

      t.timestamps
    end

    remove_column :comments, :grade
    remove_column :accommodations, :average_grade
  end
end
