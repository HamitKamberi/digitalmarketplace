require "test_helper"

class AssociatedPartnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get associated_partners_index_url
    assert_response :success
  end
end
