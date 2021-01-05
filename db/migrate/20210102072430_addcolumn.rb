class Addcolumn < ActiveRecord::Migration[6.0]
  def change
    add_reference :coments, :post, forenign_key: true
    add_reference :coments, :user, forenign_key: true
  end
end
