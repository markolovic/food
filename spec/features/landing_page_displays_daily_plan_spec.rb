require 'rails_helper'

feature 'Landing page displays daily plan' do
  scenario 'when the plan has items' do
    plan = create(:daily_plan) 
    plan.items.create(attributes_for(:item))
    #plan.items.create(name: 'milk')
    visit root_path
    expect(page).to have_css 'li', text: 'milk'
    #TODO add protein, quant and cals to expected text
    #TODO use factories more effectively
  end
end
