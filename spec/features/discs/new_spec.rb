# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'Create a disc' do
  it 'can create a new disc' do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    visit "/discs_manufacturers/#{@dm1.id}/discs"
    expect(page).to have_link('Create New Disc')

    click_link("Create New Disc")

    expect(current_path).to eq("/discs_manufacturers/#{@dm1.id}/new")

    fill_in('Name', with: 'Defender')
    check ('In production')
    fill_in('Speed', with: 13)

    click_button('Create New Disc')

    expect(current_path).to eq("/discs_manufacturers/#{@dm1.id}/discs")
    expect(page).to have_content('Defender')
  end
end
