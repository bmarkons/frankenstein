class ChangeOwnerToNotNullable < ActiveRecord::Migration[5.0]
  def change
    change_column :accommodations, :user_id, :integer, null: false
  end
end
