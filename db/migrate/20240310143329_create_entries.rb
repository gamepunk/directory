class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
