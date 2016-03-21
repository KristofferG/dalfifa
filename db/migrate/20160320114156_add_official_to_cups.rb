class AddOfficialToCups < ActiveRecord::Migration
  def change
    add_column :cups, :official, :boolean
  end
end
