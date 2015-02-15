require 'rails_helper'

describe DailyPlan do
	let(:plan) { DailyPlan.create }
	it 'should not be valid without item quantity' do
		#TODO BUG: only validates items when updating, and not on create
		plan.items << build(:item)
		expect(plan).not_to be_valid
	end
	it 'should be valid with item quantity !nil' do
		plan.items << build(:item, quantity: 1000)
		expect(plan).to be_valid
	end
end
