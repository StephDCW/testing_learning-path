require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'stephane@example.com', password: '123456', password_confirmation: '123456')
  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.title = 'Has a title'
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.body = 'Has a body'
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.title = '12'
    expect(post).to be_valid
  end

  it 'has a body between 5 and  100 characters' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.body = '12345'
    expect(post).to be_valid

    hundred_char_string = 'AHmTGQSjXTbrYogMgRXiZO3Mt0j3LoHuBr8oCFwr1OIEH1pNgaUl2NWaOksIFiGvqy0h887YJLHOTQVVkn9BqUQ54dS3aa1RgOxa'
    post.body = hundred_char_string
    expect(post).to be_valid

    post.body = hundred_char_string + '1'
    expect(post).to_not be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'A valid title',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
  end
end
