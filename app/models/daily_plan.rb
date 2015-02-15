class DailyPlan < ActiveRecord::Base
  has_and_belongs_to_many :items
	validates_associated :items
	#TODO BUG: only validates items when updating, and not on create

end
