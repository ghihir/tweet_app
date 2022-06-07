class RenameEmailColumnToStaffs < ActiveRecord::Migration[6.0]
  def change
    rename_column :staffs, :email, :name
  end
end
