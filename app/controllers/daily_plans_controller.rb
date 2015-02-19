class DailyPlansController < ApplicationController

  def show
		@plan = DailyPlan.take
    #TODO Change this to either use params id
    # or to look for plan with 'main' or 
    # 'current' attribute
  end

	def update
		@plan = DailyPlan.find(params[:id])
		if params.has_key?(:items)
			params[:items].each do |key, value|
				key = key.gsub('-', ' ')
				@plan.items.where({name: key}).take.update(quantity: value)
			end
		end
		#redirect_to daily_plan_path(params[:id])
		redirect_to root_path
		# TODO ajax
		# TODO refactor?
	end

	private

	def category_params
		params.require(:items).permit(@plan.item_names)
		#params.require(:items).tap do |whitelisted|
			#whitelisted[:items] = params[:user
	end

end
