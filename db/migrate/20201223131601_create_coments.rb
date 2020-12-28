class CreateComents < ActiveRecord::Migration[6.0]
  def change
    create_table :coments do |t|
      t.text :coment
      t.integer :user_id
      t.integer :posted_id

      t.timestamps
    end
  end
end
