require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

   setup do
     @admin_user = User.create(username: "pushan", email: "pushan@gmail.com", password: "password", admin: true)
     sign_in_as(@admin_user)
   end


   test "get new category form and create category" do
     get "/categories/new"   
     assert_response :success
     assert_difference 'Category.count', 1 do
       post categories_path, params: { category: { name: "Sports" } }
       assert_response :redirect
     end
     follow_redirect!
     assert_response :success
     assert_match "Sports", response.body
   end

   test "get new category form and reject blank category" do
     get "/categories/new"
     assert_response :success
     assert_no_difference 'Category.count' do
       post categories_path, params: { category: { name: " " } }
     end
     assert_match "blank", response.body
     assert_select 'div.alert'
     assert_select 'h4.alert-heading'
   end

   test "get new category form and reject short category" do
     get "/categories/new"
     assert_response :success
     assert_no_difference 'Category.count' do
       post categories_path, params: { category: { name: "aa" } }
     end
     assert_match "short", response.body
     assert_select 'div.alert'
     assert_select 'h4.alert-heading'
   end
end
