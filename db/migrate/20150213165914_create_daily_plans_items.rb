class CreateDailyPlansItems < ActiveRecord::Migration
  def change
    create_table :daily_plans_items, id: false do |t|
      t.belongs_to :daily_plan, index: true
      t.belongs_to :item, index: true
    end
  end
end
