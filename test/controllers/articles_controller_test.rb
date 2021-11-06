require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "pushan", email: "pushan@gmail.com", password: "password", admin: true)
  end



#  test "should get new" do
#    get articles_new_url
#    assert_response :success
#  end

   test "should create article" do
    sign_in_as(@admin_user)
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: {title: "Test Article", text: "This a test" } }
   end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

end
