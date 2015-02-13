class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :calories
      t.float :protein
      t.float :fat
      t.float :quantity

      t.timestamps
    end
  end
end
