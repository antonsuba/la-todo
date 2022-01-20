class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :content
      t.references :todo, foreign_key: true
      t.integer :pos_num
      t.integer :pos_den
      t.timestamps
    end
  end
end
