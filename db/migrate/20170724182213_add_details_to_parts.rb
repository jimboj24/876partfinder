class AddDetailsToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :details, :text
  end
end
