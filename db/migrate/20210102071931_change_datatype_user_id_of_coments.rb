class ChangeDatatypeUserIdOfComents < ActiveRecord::Migration[6.0]
  def change
    remove_column :coments, :user_id
    remove_column :coments, :posted_id
  end
end
