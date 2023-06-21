require 'rails_helper'

RSpec.describe 'User post index page', type: :system do
  fixtures :users, :posts, :comments, :likes

  before do
    @user = users(:first_user)
  end

  it "displays the user's profile picture and username" do
    visit user_posts_path(@user)

    expect(page).to have_selector("img[src='#{@user.photo}']")
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(@user)

    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it "displays a post's title, body, comments, and likes" do
    post = posts(:first_post)

    visit user_post_path(@user, post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'redirects to post show page when a post is clicked' do
    post = posts(:first_post)

    visit user_posts_path(@user)

    click_link post.title

    expect(page).to have_current_path(user_post_path(@user, post))
  end
end
