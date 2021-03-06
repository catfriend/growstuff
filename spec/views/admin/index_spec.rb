require 'spec_helper'

describe 'admin/index.html.haml', :type => "view" do
  before(:each) do
    @member = FactoryGirl.create(:admin_member)
    sign_in @member
    controller.stub(:current_user) { @member }
    render
  end

  it "includes links to manage various things" do
    assert_select "a", :href => account_types_path
    assert_select "a", :href => products_path
    assert_select "a", :href => roles_path
    assert_select "a", :href => forums_path
  end

  it "has a link to newsletter subscribers" do
    rendered.should contain "Newsletter subscribers"
  end
end
