class CreateHelpPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hposts do |t|
      t.string :title
      t.string :h_request
      t.string :user_id
      t.timestamps
    end
  end
end
