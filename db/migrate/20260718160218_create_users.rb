class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :remember_token
      t.string :role, null: false
      t.datetime :remember_token_expires_at
      t.string :reset_password_token
      t.datetime :reset_password_token_expires_at
      t.datetime :reset_password_email_sent_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
