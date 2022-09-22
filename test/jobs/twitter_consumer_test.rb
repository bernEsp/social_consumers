require "test_helper"

class TwitterConsumerTest < ActiveJob::TestCase
  test "calls twitter social network" do
    stub_get = stub_request(:get, "https://takehome.io/twitter")
    TwitterConsumerJob.perform_now
    assert_requested(stub_get)
  end

  test 'returns response' do
    stub_get = stub_request(:get, "https://takehome.io/twitter").to_return(
      body: '[{"username":"@GuyEndoreKaiser","tweet":"If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day."},{"username":"@mikeleffingwell","tweet":"STOP TELLING ME YOUR NEWBORNS WEIGHT AND LENGTH I DONT KNOW WHAT TO DO WITH THAT INFORMATION."}]'
    )
    TwitterConsumerJob.perform_now
    assert_requested(stub_get)
  end

  test 'raises consumer invalid and returns indepotent false' do
    stub_get = stub_request(:get, "https://takehome.io/twitter").to_return(
      body: '"I am trapped in a social media factory send help"'
    )

    res = TwitterConsumerJob.perform_now
    assert_requested(stub_get)
    assert_not(res)
  end

  test 'raises active model strict validation and returns indepotent false' do
    stub_get = stub_request(:get, "https://takehome.io/twitter").to_return(
      body: '[{tweet: "good"}]'
    )

    res = TwitterConsumerJob.perform_now
    assert_requested(stub_get)
    assert_not(res)
  end

end
