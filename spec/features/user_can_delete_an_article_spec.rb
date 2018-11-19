require 'rails_helper'

describe 'user visiting article show page' do
  it 'can delete an article' do
    article_1 = Article.create!(title: "Title 1", body: "Body 1")

    visit article_path(article_1)
    click_on 'Delete'

    expect(current_path).to eq(articles_path)
    expect(page).to_not have_content(article_1.title)
  end
end
