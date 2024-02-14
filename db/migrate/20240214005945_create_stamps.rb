class CreateStamps < ActiveRecord::Migration[7.0]
  def change
    create_table :stamps do |t|
      t.string :event
      t.string :record
      t.integer :user_id

      t.timestamps
    end
  end
end
