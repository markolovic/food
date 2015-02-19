require 'rails_helper'

describe Item, 'validations' do
	let(:milk) { build(:item) }
	it 'should not have a negative quantity' do
		milk.quantity = -1
		expect(milk).not_to be_valid
	end
	it 'should not have a negative unit_quantity' do
		milk.unit_quantity = -1
		expect(milk).not_to be_valid
	end
	it 'should not have negative protein' do
		milk.protein= -1
		expect(milk).not_to be_valid
	end
	it 'should not have negative calories' do
		milk.calories= -1
		expect(milk).not_to be_valid
	end
	it 'should not have negative fat' do
		milk.fat = -1
		expect(milk).not_to be_valid
	end
	context 'item is part of a plan' do
		it 'should not be valid without a quantity' do
			plan = create(:daily_plan)
			plan.items << milk
			expect(milk.part_of_plan?).to be true
			expect(milk).not_to be_valid
		end
	end
	context 'item is not part of a plan' do
		it 'should be valid without a quantity' do
			expect(milk).to be_valid
		end
	end
end
describe Item, '#total_protein' do
	it 'returns right amount' do
		milk = create(:item, quantity: 2000)
		expect(milk.total_protein).to eq 60
	end
end

describe Item, '#total_calories' do
	it 'returns right amount' do
		milk = create(:item, quantity: 2000)
		expect(milk.total_calories).to eq 1240
	end
end

describe Item, '#units' do
	context 'quantity is set' do
		let(:item) { create(:item, quantity: 2000) }
		it 'returns the right amount'	do
			expect(item.units).to eq 2
		end
	end
	context 'quantity is nil' do
		let(:item) { create(:item) }
		it 'should return nil' do
			expect(item.units).to be nil
		end
	end
end

describe Item, '#part_of_plan?' do
	let(:milk) { build(:item) }
	context 'when item is part of plan' do
		#TODO refactor to move setup outside?
		it 'should return true' do
			plan = create(:daily_plan)
			plan.items << milk
			expect(milk.part_of_plan?).to be true
		end
	end
	context 'when item is not part of plan' do
		it 'should return false' do
			expect(milk.part_of_plan?).to be false
		end
	end
end
