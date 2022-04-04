class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :profile, :null => false
      t.string :type, :null => false
      t.string :phone
      t.string :address
      t.date :dob
      t.integer :create_user_id, :null => false
      t.integer :updated_user_id, :null => false
      t.integer :deleted_user_id
      t.timestamp :created_at, :null => false
      t.timestamp :updated_at, :null => false
      t.timestamp :deleted_at
    end
  end
end
