class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.boolean :notice, default: false

      t.timestamps
    end
  end
end
