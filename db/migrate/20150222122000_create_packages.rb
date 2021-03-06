class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.string :version
      t.datetime :publication
      t.string :title
      t.text :description
      t.string :authors
      t.string :maintainers

      t.timestamps
    end
  end
end
