class AddRecipkindToTrecps < ActiveRecord::Migration[6.0]
  def change
    add_column :trecps, :recipkind, :integer
  end
end
