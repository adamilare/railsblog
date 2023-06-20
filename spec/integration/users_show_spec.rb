require 'rails_helper'

RSpec.describe "User show page", type: :system do
  fixtures :users, :posts

  before do
    @user = users(:first_user)
  end

  it "displays the user's profile picture, username, number of posts, and bio" do
    visit user_path(@user)

    expect(page).to have_selector("img[src='#{@user.photo}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    expect(page).to have_content(@user.bio)
  end

  it "displays the user's first 3 posts" do
    first_post = posts(:first_post)
    second_post = posts(:second_post)
    third_post = posts(:third_post)
    fourth_post = posts(:fourth_post)

    visit user_path(@user)

    expect(page).to have_content(first_post.title)
    expect(page).to have_content(second_post.title)
    expect(page).to have_content(third_post.title)
    expect(page).not_to have_content(fourth_post.title)
  end

  it "redirects to post show page when a user's post is clicked" do
    post = posts(:first_post)

    visit user_path(@user)

    click_link post.title

    expect(page).to have_current_path(user_post_path(@user, post))
  end

  it "redirects to user post index page when 'View All Posts' button is clicked" do
    visit user_path(@user)
    click_link "See all posts"

    expect(page).to have_current_path(user_posts_path(@user))
  end
end
