class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.string :name

      t.timestamps
    end
  end
end
