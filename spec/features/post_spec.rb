require 'rails_helper'

describe 'new post' do
  it "ensures that that the form route works with the new action" do
    visit new_post_path
    expect(page.status_code).to equal(200)
  end

  it "renders the html file containing the form" do
    visit new_post_path
    expect(page).to have_content("Post Form")
  end

  it "submission will redirect the user to the show page where it displays the title and description of the post" do
    visit new_post_path
    fill_in "post_title", with: "My post title"
    fill_in "post_description", with: "My post description"

    click_on "Submit Post"

    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content('My post title')
    expect(page).to have_content('My post description')
  end
end
