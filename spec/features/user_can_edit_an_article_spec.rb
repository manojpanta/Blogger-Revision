require "rails_helper"

describe 'user visiting article show page ' do
  it 'can edit an article' do
    article_1 = Article.create!(title: "Title 1", body: "Body 1")

    visit article_path(article_1)

    click_on 'Edit'

    fill_in 'article[title]', with: 'Title 0'
    fill_in 'article[body]', with: 'body4'

    click_on 'Update'

    expect(current_path).to eq(article_path(article_1))

    expect(page).to have_content('Title 0')
    expect(page).to have_content('body4')
    expect(page).to_not have_content(article_1.title)
  end
end
