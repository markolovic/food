class DailyPlan < ActiveRecord::Base
  has_and_belongs_to_many :items
	validates_associated :items
	accepts_nested_attributes_for :items
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

	#TODO need to test
	def item_names
		names = []
		items.all.each do |item|
			names.push(item.name)
		end
		names
		#TODO refactor!
	end
end
