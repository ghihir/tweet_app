class RemoveAdminFromStaffs < ActiveRecord::Migration[6.0]
  def change
    remove_column :staffs, :admin, :boolean
  end
end
