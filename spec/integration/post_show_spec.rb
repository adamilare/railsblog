require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  fixtures :users, :posts, :comments, :likes

  before do
    @user = users(:first_user)
    @post = posts(:first_post)
  end

  it "displays the post's title, author, comments, likes, body, and comments' authors and texts" do
    first_comment = comments(:first_comment)
    second_comment = comments(:second_comment)

    visit user_post_path(@user, @post)

    expect(page).to have_content(@post.author.name)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.text)
    expect(page).to have_content("Comments: #{first_comment.post.comments_counter}")
    expect(page).to have_content(first_comment.author.name)
    expect(page).to have_content(first_comment.text)
    expect(page).to have_content(second_comment.author.name)
    expect(page).to have_content(second_comment.text)
    expect(page).to have_content("Likes: #{first_comment.post.likes_counter}")
  end
end
