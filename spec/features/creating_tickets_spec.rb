require 'spec_helper'

feature "Creating tickets" do
  before do
    project = FactoryGirl.create(:project, name: "TextMate 2")
    visit '/'
    click_link 'TextMate 2'
    click_link "New Ticket"
  end

  scenario "creating a ticket with invalid attachments" do
    fill_in "Title", with: "Add documentation for blink tag"
    fill_in "Description", with: "The blink tag has a speed attribute"
    attach_file "File #1", Rails.root.join("spec/fixtures/speed.txt")
    attach_file "File #2", Rails.root.join("spec/fixtures/speed.txt")
    attach_file "File #3", Rails.root.join("spec/fixtures/speed.txt")
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has not been created.")
  end
 scenario "creating a ticket with valid attachments" do
    fill_in "Title", with: "Add documentation for blink tag"
    fill_in "Description", with: "The blink tag has a speed attribute"
    attach_file "File #1", Rails.root.join("spec/fixtures/speed.jpg")
    attach_file "File #2", Rails.root.join("spec/fixtures/speed.png")
    attach_file "File #3", Rails.root.join("spec/fixtures/speed.gif")
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has been created.")
  end
end
