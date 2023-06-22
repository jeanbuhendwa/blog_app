require 'rails_helper'

describe Post, type: :model do
  let!(:test_user) { User.create(name: 'Tom', email: 'tom@example.com', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.') }
  let!(:test_post) { Post.create(author: test_user, title: 'Hello', text: 'This is my first post') }

  before { test_post.reload }

  it 'Title should be present' do
    test_post.title = nil
    expect(test_post).to_not be_valid
  end

  it 'comment counter should be integer' do
    test_post.comments_counter = 1.5
    expect(test_post).to_not be_valid
  end

  it 'comment counter should be greater than or equal to zero' do
    test_post.comments_counter = -1
    expect(test_post).to_not be_valid
  end

  it 'like counter should be integer' do
    test_post.likes_counter = 1.5
    expect(test_post).to_not be_valid
  end

  it 'like counter should be greater than or equal to zero' do
    test_post.likes_counter = -1
    expect(test_post).to_not be_valid
  end

  it 'post should increase user post counter by 1' do
    # it will increase automatically after post save
    expect(test_user.post_counter).to eq(1)
  end
end

describe User, type: :model do
  let!(:test_user) { User.create(name: 'Tom', email: 'tom@example.com', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.') }

  before { test_user.reload }

  it 'Name should be present' do
    test_user.name = nil
    expect(test_user).to_not be_valid
  end

  it 'Name should contain at least one character' do
    test_user.name = ''
    expect(test_user).to_not be_valid
  end

  it 'post counter should be integer' do
    test_user.post_counter = 1.5
    expect(test_user).to_not be_valid
  end

  it 'post counter should be greater than or equal to zero' do
    test_user.post_counter = -1
    expect(test_user).to_not be_valid
  end
end
