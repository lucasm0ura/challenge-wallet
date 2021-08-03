# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Required
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''      
      
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      t.string :name
      t.string :email, null: false, default: ""
      t.integer :role_id, null:false
      
      ## Tokens
      t.json :tokens

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end
