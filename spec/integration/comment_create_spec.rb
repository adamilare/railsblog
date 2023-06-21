require 'rails_helper'

RSpec.describe 'Comments form', type: :system do
  fixtures :users, :posts

  before do
    @user = users(:first_user)
    @post = posts(:first_post)
  end

  it 'creates a new comment for the post when submitted' do
    visit user_post_path(@user, @post)

    new_comment = 'Something Nice'
    fill_in 'comment_text', with: new_comment

    click_button 'Add'
    expect(page).to have_selector('li', text: new_comment)

    expect(Comment.last.text).to eq(new_comment)
  end
end
