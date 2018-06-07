class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :notes
      t.integer :contact_id

      t.timestamps

    end
  end
end
