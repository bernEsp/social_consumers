require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end


  test 'should get index json' do
    get dashboard_index_url
    assert_equal "application/json; charset=utf-8", response.content_type
  end

  test 'should get twitter' do
    get dashboard_index_url
    assert(response.body['twitter'])
  end

  test 'should get facebook' do
    get dashboard_index_url
    assert(response.body['facebook'])
  end

  test 'should get instagram' do
    get dashboard_index_url
    assert(response.body['instagram'])
  end
end
