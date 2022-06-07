class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.timestamps
    end
  end
end
