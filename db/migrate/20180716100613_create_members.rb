class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :major
      t.string :image

      t.timestamps
    end
  end
end
