class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :company_id
      t.integer :contact_id

      t.timestamps

    end
  end
end
