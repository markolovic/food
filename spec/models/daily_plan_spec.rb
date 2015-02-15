require 'rails_helper'

describe DailyPlan do
	context 'should' do
		
	end
	it 'should not be valid without item quantity' do
		#TODO BUG: only validates items when updating, and not on create
		plan = DailyPlan.create
		plan.items << build(:item)
		expect(plan).not_to be_valid
	end
	it 'should be valid with item quantity !nil' do
	end
end
