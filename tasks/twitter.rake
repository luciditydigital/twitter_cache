require 'rubygems'
gem 'twitter'
require 'config/initializers/twitter.rb'
gem 'memcache-client'
require 'config/initializers/memcached.rb'
require 'twitter_cache'

namespace :twitter do
  desc "Update twitter statuses file"
  task :update do
    TwitterCache.update_user_timeline_cache(
      TWITTER_USERNAME, TWITTER_PASSWORD, CACHE, :limit => 2,
      :key => 'twitter_cache')
    puts "Twitter statuses updated successfully"
  end
end
