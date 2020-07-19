class AlterMessages < ActiveRecord::Migration[6.0]
  def change
    drop_table :messages
    create_table :messages do |t|
      t.text :content
      t.references :conversation, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
