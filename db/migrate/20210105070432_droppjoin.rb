class Droppjoin < ActiveRecord::Migration[6.0]
  def change
    drop_table :joins
  end
end
