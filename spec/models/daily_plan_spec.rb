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

describe DailyPlan, '#total_protein' do
  context 'plan has items' do
    let(:plan) { create(:plan_with_items) }
    it 'should return right value' do
      expect(plan.total_protein).to eq 43
    end
  end
  context 'plan does not have items' do
    let(:plan) { create(:daily_plan) }
    it 'should return 0' do
      expect(plan.total_protein).to eq 0
    end
  end
end

describe DailyPlan, '#total_calories' do
  context 'plan has items' do
    let(:plan) { create(:plan_with_items) }
    it 'should return right value' do
      expect(plan.total_calories).to eq 775
    end
  end
  context 'plan does not have items' do
    let(:plan) { create(:daily_plan) }
    it 'should return 0' do
      expect(plan.total_calories).to eq 0
    end
  end
end
