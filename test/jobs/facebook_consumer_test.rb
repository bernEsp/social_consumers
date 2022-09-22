require "test_helper"

class FacebookConsumerTest < ActiveJob::TestCase
  test "calls facebook social network" do
    stub_get = stub_request(:get, "https://takehome.io/facebook")
    FacebookConsumerJob.perform_now
    assert_requested(stub_get)
  end

  test 'returns response' do
    stub_get = stub_request(:get, "https://takehome.io/facebook").to_return(
      body: '[{"name":"Some Friend","status":"Here some photos of my holiday. Look how much more fun Im having than you are!"},
      {"name":"Drama Pig","status":"I am in a hospital. I will not tell you anything about why I am here."}]'
    )
    FacebookConsumerJob.perform_now
    assert_requested(stub_get)
  end

  test 'raises consumer invalid and returns indepotent false' do
    stub_get = stub_request(:get, "https://takehome.io/facebook").to_return(
      body: '"I am trapped in a social media factory send help"'
    )

    res = FacebookConsumerJob.perform_now
    assert_requested(stub_get)
    assert_not(res)
  end

  test 'raises active model strict validation and returns indepotent false' do
    stub_get = stub_request(:get, "https://takehome.io/facebook").to_return(
      body: '[{status: "good"}]'
    )

    res = FacebookConsumerJob.perform_now
    assert_requested(stub_get)
    assert_not(res)
  end

  test 'store response in facebook post' do
    assert_difference ->{ FacebookPost.count }, 2 do
      stub_get = stub_request(:get, "https://takehome.io/facebook").to_return(
        body: '[{"name":"Some Friend","status":"Here some photos of my holiday. Look how much more fun Im having than you are!"},
        {"name":"Drama Pig","status":"I am in a hospital. I will not tell you anything about why I am here."}]'
      )
      FacebookConsumerJob.perform_now
    end
  end

end
