class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :description, :null => false
      t.integer :status, :null => false
      t.integer :create_user_id, :null => false
      t.integer :updated_user_id, :null => false
      t.integer :deleted_user_id
      t.timestamp :created_at, :null => false
      t.timestamp :updated_at, :null => false
      t.timestamp :deleted_at
    end
  end
end
