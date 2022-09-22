require "test_helper"

class InstagramConsumerTest < ActiveJob::TestCase
  test "calls instagram social network" do
    stub_get = stub_request(:get, "https://takehome.io/instagram")
    InstagramConsumerJob.perform_now
    assert_requested(stub_get)
  end

  test 'returns response' do
    stub_get = stub_request(:get, "https://takehome.io/instagram").to_return(
      body: '[{"username":"hipster1","picture":"food"},{"username":"hipster2","picture":"coffee"},{"username":"hipster3","picture":"coffee"},{"username":"hipster4","picture":"food"},{"username":"hipster5","picture":"this one is of a cat"}]'
    )
    InstagramConsumerJob.perform_now
    assert_requested(stub_get)
  end

  test 'raises consumer invalid and returns indepotent false' do
    stub_get = stub_request(:get, "https://takehome.io/instagram").to_return(
      body: '"I am trapped in a social media factory send help"'
    )

    res = InstagramConsumerJob.perform_now
    assert_requested(stub_get)
    assert_not(res)
  end

  test 'raises active model strict validation and returns indepotent false' do
    stub_get = stub_request(:get, "https://takehome.io/instagram").to_return(
      body: '[{picture: "good"}]'
    )

    res = InstagramConsumerJob.perform_now
    assert_requested(stub_get)
    assert_not(res)
  end

end
