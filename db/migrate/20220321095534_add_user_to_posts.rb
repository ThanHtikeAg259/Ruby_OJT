class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, column: :create_user_id
    add_foreign_key :posts, :users, column: :updated_user_id
  end
end
