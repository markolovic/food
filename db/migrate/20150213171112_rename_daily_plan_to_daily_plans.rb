class RenameDailyPlanToDailyPlans < ActiveRecord::Migration
  def change
    rename_table :daily_plan, :daily_plans
  end
end
