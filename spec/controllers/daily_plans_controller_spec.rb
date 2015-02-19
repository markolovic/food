require 'rails_helper'

describe DailyPlansController, '#update' do
  let!(:plan) { create(:plan_with_items) }
  before :each do
    patch :update, id: 1, items: {"milk" => 2000, "boiled egg" => 300}
    #TODO rename items to quantities?
  end
  it 'redirects to daily_plans#show' do
    should redirect_to(plan)
  end
  it 'updates the item quantities' do
    expect(plan.items.where({name: 'milk'}).take.quantity).to eq 2000
    expect(plan.items.where({name: 'boiled egg'}).take.quantity).to eq 300
  end
end
