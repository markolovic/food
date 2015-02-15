require 'rails_helper'

feature 'Landing page displays daily plan' do
  scenario 'when the plan has items' do
    plan = create(:daily_plan) 
    milk = plan.items.create(attributes_for(:item))
    milk.update(quantity: milk.unit_quantity)
    #plan.items.create(name: 'milk')
    visit root_path
    expect(page).to have_css 'td', text: 'milk'
    expect(page).to have_css 'td', text: '620'
    expect(page).to have_css 'td', text: '30'
    #TODO add protein, quant and cals to expected text
    #TODO use factories more effectively
  end
end
