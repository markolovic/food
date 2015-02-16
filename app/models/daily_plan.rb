class DailyPlan < ActiveRecord::Base
  has_and_belongs_to_many :items
	validates_associated :items
	#TODO BUG: only validates items when updating, and not on create
	
	def total_protein
		items.all.inject(0) do |sum, item|
			sum += item.total_protein
		end
	end

	def total_calories
		items.all.inject(0) do |sum, item|
			sum += item.total_calories
		end
	end

end
