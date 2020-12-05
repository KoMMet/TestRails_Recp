class CreateTrecps < ActiveRecord::Migration[6.0]
  def change
    create_table :trecps do |t|
      t.references :usr, foreign_key: {to_table: :tusers} 
      t.string :title
      t.text :explanation

      t.timestamps
    end
  end
end
