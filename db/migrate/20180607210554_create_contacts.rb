class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.string :linkedin
      t.date :last_connected_date
      t.string :email
      t.integer :category_id
      t.integer :user_id

      t.timestamps

    end
  end
end
