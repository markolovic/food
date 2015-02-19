require 'rails_helper'

feature 'User changes item quantity from table spec' do
  scenario 'successfully' do
    plan = create(:plan_with_items)
    visit root_path
    expect(plan.items.where({name: 'milk'}).take.units).to eq 1
    expect(page).to have_css 'td', text: '43' # total row
    expect(page).to have_css 'td', text: '775' # total row
    within('#milk') do
      fill_in 'milk-quantity', with: '2000'
    end
    click_button 'Save'
    expect(plan.items.where({name: 'milk'}).take.quantity).to eq 2000
    expect(page).to have_css 'td', text: '73'
    expect(page).to have_css 'td', text: '1395'
  end
end
