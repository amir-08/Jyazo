class RemoveFnameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :fname, :string
  end
end
