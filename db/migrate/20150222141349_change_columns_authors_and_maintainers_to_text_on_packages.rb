class ChangeColumnsAuthorsAndMaintainersToTextOnPackages < ActiveRecord::Migration
  def change
    change_column :packages, :authors, :text
    change_column :packages, :maintainers, :text
  end
end
