require "test_helper"

class InBodiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get in_bodies_index_url
    assert_response :success
  end
end
