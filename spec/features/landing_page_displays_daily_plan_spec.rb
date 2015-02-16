require 'rails_helper'

feature 'Landing page displays daily plan' do
  scenario 'when the plan has items' do
    plan = create(:daily_plan) 
    # TODO refactor to use plan_with_items factory
    milk = create(:item, quantity: 1000)
    egg = create(:egg, quantity: 100)
    plan.items << milk << egg
    #plan.items.create(name: 'milk')
    visit root_path
    expect(page).to have_css 'td', text: 'milk'
    expect(page).to have_css 'td', text: '620'
    expect(page).to have_css 'td', text: '13'
    expect(page).to have_css 'td', text: '43' # total row
    expect(page).to have_css 'td', text: '775' # total row
    #TODO add protein, quant and cals to expected text
    #TODO use factories more effectively
  end
end
