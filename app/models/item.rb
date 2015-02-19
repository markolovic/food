class Item < ActiveRecord::Base
  has_and_belongs_to_many :daily_plans
	validates_presence_of :quantity, if: :part_of_plan?
	validates :protein, :calories, :fat, :unit_quantity,
																	numericality: {greater_than_or_equal_to: 0}
	validates_numericality_of :quantity, greater_than_or_equal_to: 0, allow_nil: true

	def total_protein
		protein * (quantity / 100)
	end

	def total_calories
		calories * (quantity / 100)
	end

	def units
		quantity ? quantity / unit_quantity : nil
	end

	def set_units
	end

	def part_of_plan?
		daily_plans.all.any?
		# associated plans must be persisted to the DB
	end

end
