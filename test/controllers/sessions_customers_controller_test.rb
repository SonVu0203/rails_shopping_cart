require 'test_helper'

class SessionsCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_customers_new_url
    assert_response :success
  end

end
