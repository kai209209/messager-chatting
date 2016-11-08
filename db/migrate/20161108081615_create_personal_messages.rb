class CreatePersonalMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_messages do |t|
      t.text :body
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
