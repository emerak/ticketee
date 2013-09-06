require 'spec_helper'
require 'capybara/rails'
feature 'Creating Projects' , :js => true do
  scenario "can create a project" do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', with: 'TextMate 2'
    fill_in 'Description', with: 'A text-editor for OS X'
    click_button 'Create Project'
    expect(page).to have_content('Project has been created.')
  end
end
