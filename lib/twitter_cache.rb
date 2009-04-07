# requires 'twitter' gem
class TwitterCache
  DEFAULTS = {:limit => 2, :key => 'twitter_cache'}

  class << self
    def user_timeline(username, password, cache, options = {})
      options.reverse_merge!(DEFAULTS)
      @cache ||= cache
      cache_get(options[:key]) || update_user_timeline_cache(username, password, cache, options)
    end

    def update_user_timeline_cache(username, password, cache, options = {})
      options.reverse_merge!(DEFAULTS)
      @cache ||= cache
      begin
        statuses = Twitter::Base.new(username, password).timeline(:user)[0, options[:limit]]
        if statuses
          statuses = statuses[0, options[:limit]]
          cache_add(options[:key], statuses)
          statuses
        end
      rescue Twitter::Unavailable
        log("Fail Whale: #{$!}")
      rescue Twitter::Unauthorized
        log("Check username/password: #{$!}")
      end
    end

    private
    def cache_get(cache_key)
      memcache_rescue do
        @cache.get(cache_key)
      end
    end

    def cache_set(cache_key, data, expiry = 0)
      memcache_rescue do
        @cache.set(cache_key, data, expiry)
      end
    end

    # according to the documentation http://seattlerb.rubyforge.org/memcache-client/
    # Add should be used in the event of a cache miss as opposed to set
    def cache_add(cache_key, data, expiry = 0)
      memcache_rescue do
        @cache.add(cache_key, data, expiry)
      end
    end

    def memcache_rescue
      yield
    rescue MemCache::MemCacheError
      log "MemcacheError: #{$!}"
    end

    def log(msg)
      if const_defined? 'RAILS_DEFAULT_LOGGER'
        RAILS_DEFAULT_LOGGER.error msg
      else
        puts msg
      end
    end
  end
end