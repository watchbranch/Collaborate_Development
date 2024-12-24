require "test_helper"

class PerformanceControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get performance_index_url
    assert_response :success
  end
end
