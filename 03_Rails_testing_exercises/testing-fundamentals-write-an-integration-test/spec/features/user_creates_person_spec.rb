require 'rails_helper'

feature 'user creates person' do
  scenario 'with valid data' do
    visit new_person_path

    fill_in 'First name',	with: 'Chenchen'
    click_on 'Create Person'

    expect(page).to have_content("Person created.")
    expect(page).to have_content('Chenchen')
  end

  scenario 'without valid data' do
    visit new_person_path

    fill_in 'First name',	with: nil
    click_on 'Create Person'

    expect(page).not_to have_content('Chenchen')
  end
end
