require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get filtered page' do
    get home_filter_url, params: { selected_tag: 'photos' }
    assert_response :success
  end
end
