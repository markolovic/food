class DailyPlanController < ApplicationController

  def show
		@plan = DailyPlan.take
    #TODO Change this to either use params id
    # or to look for plan with 'main' or 
    # 'current' attribute
  end

end
