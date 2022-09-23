every 5.minutes do
  rake 'consumer:facebook', environment: 'development'
  rake 'consumer:twitter', environment: 'development'
  rake 'consumer:instagram', environment: 'development'
end
