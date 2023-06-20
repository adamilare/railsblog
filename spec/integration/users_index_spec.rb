require 'rails_helper'

RSpec.describe "User index page", type: :system do
  fixtures :users, :posts

  setup do
    @first_user = users(:first_user)
    @second_user = users(:second_user)
  end

  it "displays the username and profile picture for each user" do
    visit users_path

    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@second_user.name)

    expect(page).to have_selector("img[src='#{@first_user.photo}']")
    expect(page).to have_selector("img[src='#{@second_user.photo}']")
  end

  it "displays the number of posts each user has written" do
    first_post = posts(:first_post)
    second_post = posts(:second_post)
    
    visit users_path
    
    expect(page).to have_content("Number of posts: #{first_post.author.posts_counter}")
    expect(page).to have_content("Number of posts: #{second_post.author.posts_counter}")
  end

  it "redirects to user show page when a user is clicked" do
    visit users_path
    click_link @first_user.name

    expect(page).to have_current_path(user_path(@first_user))
  end
end
