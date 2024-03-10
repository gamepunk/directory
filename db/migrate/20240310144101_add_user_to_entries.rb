class AddUserToEntries < ActiveRecord::Migration[7.1]
  def change
    add_reference :entries, :user, null: false, foreign_key: true
  end
end
