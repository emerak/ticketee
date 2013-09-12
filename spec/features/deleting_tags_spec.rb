
require 'spec_helper'
feature "Deleting tags" do
  project = FactoryGirl.create(:project, name: "Project one and two")
  ticket  = FactoryGirl.create(:ticket,:project => project,:tag_names => "this-tag-must-die")
  before do
    visit '/'
    click_link project.name
    click_link ticket.title
  end
  scenario "Deleting a tag", :js => true do
    click_link "delete-this-tag-must-die"
    page.should_not have_content("this-tag-must-die")
  end
end
