class AddDeletedAtToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :deleted_at, :datetime
    add_index :parts, :deleted_at
  end
end
