require 'spec_helper'
feature "Creating comments" do
  before do
    project = FactoryGirl.create(:project)
    visit '/'
    click_link project.name
    click_link "New Ticket" 
    fill_in "Title", with: "Add documentation for blink tag"
    fill_in "Description", with: "The blink tag has a speed attribute"
    attach_file "File #1", Rails.root.join("spec/fixtures/speed.png")
    attach_file "File #2", Rails.root.join("spec/fixtures/speed.png")
    attach_file "File #3", Rails.root.join("spec/fixtures/speed.png")
    click_button "Create Ticket"

  end
  scenario "Creating a comment" do
    fill_in "Text", :with => "Added a comment!"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
  end
  scenario "Creating an invalid comment" do
    click_button "Create Comment"
    page.should have_content("Comment has not been created.")
  end
end
