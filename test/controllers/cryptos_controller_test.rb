require "test_helper"

class CryptosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # getting the URL for the index action of CryptosController
    get cryptos_index_url
    assert_response :success
  end
end
