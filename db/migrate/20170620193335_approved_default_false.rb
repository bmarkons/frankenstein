class ApprovedDefaultFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_default :accommodations, :approved, false
  end
end
