class CreateTusers < ActiveRecord::Migration[6.0]
  def change
    create_table :tusers do |t|
      t.string :name, default:""
      t.string :pass, default:""
      t.date :jointime

      t.timestamps
    end
  end
end
