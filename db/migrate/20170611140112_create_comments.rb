class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.float :grade
      t.text :text
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end
