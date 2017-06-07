class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :online, :boolian, default: :false
  end
end
