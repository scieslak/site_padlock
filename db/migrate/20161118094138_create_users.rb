class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :password_recovery
      t.boolean :admin
      t.string :email_confirmation

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
  end
end
