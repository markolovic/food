require 'rails_helper'

feature 'Plan_show_page_displays_list_of_items' do
  scenario 'successfully', js: true do 
    plan = create(:plan_with_items)
    cheese = create(:item, name: 'cheese')
    visit root_path
    expect(page).not_to have_css '#item list li', text: cheese
    click_on 'All items'
    expect(current_path).to eq root_path
    expect(page).to have_css '#item list li', text: cheese
    # Need within ?
    # TODO test ajax
  end
end
