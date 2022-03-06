require 'test_helper'

class ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reserves_index_url
    assert_response :success
  end

end
