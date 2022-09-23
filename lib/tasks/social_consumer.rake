namespace :consumer do
  desc 'I am the facebook consumer.'
  task :facebook  => :environment do
    FacebookConsumerJob.perform_later
  end

  desc 'I am the Instagram consumer'
  task :instagram  => :environment do
    InstagramConsumerJob.perform_later
  end

  desc 'I am the Twitter consumer'
  task :twitter => :environment do
    TwitterConsumerJob.perform_later
  end
end
