class Item < ActiveRecord::Base
  has_and_belongs_to_many :daily_plans
	validates_presence_of :quantity, if: :part_of_plan?

	def total_protein
		protein * (quantity / 100)
	end

	def total_calories
		calories * (quantity / 100)
	end

	def units
		quantity ? quantity / unit_quantity : nil
	end

	def part_of_plan?
		daily_plans.all.any?
		# associated plans must be persisted to the DB
	end

end
