require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

   setup do
     request.headers['Authorization'] = ActionController::HttpAuthentication::Basic.encode_credentials("pushan", "pushan")
     @admin_user = User.create(username: "pushan", email: "pushan.mukerjee@gmail.com", password: "password", admin: true)
     sign_in_as(@admin_user)
   end

   test "get new article form and create article" do
     get "/articles/new", headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('pushan', 'pushan') }
     assert_response :success
     assert_difference 'Article.count', 1 do
       post articles_path, params: { article: { title: "Test Article", text: "Test" } } 
       assert_response :redirect
     end
     follow_redirect!
     assert_response :success
     assert_match "Test Article", response.body
   end

   test "get new article form and reject blank article" do
     get "/articles/new"
     assert_response :success
     assert_no_difference 'Article.count' do
       post articles_path, params: { article: { title: " ", text: "Test", user: @admin_user } }
     end
     assert_match "blank", response.body
     assert_select 'div.alert'
     assert_select 'h4.alert-heading'
   end

   test "get new article form and reject short article" do
     get "/articles/new"
     assert_response :success
     assert_no_difference 'Article.count' do
       post articles_path, params: { article: { title: "aa", text: "Test", user: @admin_user } }
     end
     assert_match "short", response.body
     assert_select 'div.alert'
     assert_select 'h4.alert-heading'
   end

  # test "the truth" do
  #   assert true
  # end
end
