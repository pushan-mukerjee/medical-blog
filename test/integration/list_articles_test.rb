require 'test_helper'

class ListArticlesTest < ActionDispatch::IntegrationTest
  def setup
    @article = Article.create(title: "test article a", text: "Test")
    @article2 = Article.create(title: "test article b", text: "Test")
  end

  test "should show articles listing" do
    get '/articles'
    assert_select "a[href=?]", article_path(@article), text: @article.title
    assert_select "a[href=?]", article_path(@article2), text: @article2.title
  end

  # test "the truth" do
  #   assert true
  # end
end
