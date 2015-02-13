class DailyPlan < ActiveRecord::Migration
  def change
    create_table :daily_plan do |t|
      t.timestamps
    end
  end
end
