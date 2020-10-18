class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :varchar
    add_column :users, :admin, :integer
  end
end
