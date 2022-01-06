class CreateGratitudePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :gposts do |t|
      t.string :comment
      t.string :likes
      t.string :user_id
      t.timestamps
    end
  end
end
