module Inspectr
  class Config
    attr_accessor :queue_url, :access_key_id, :secret_access_key, :region, :origin

    def initialize
      @access_key_id = ENV['AWS_SQS_ACCESS_KEY_ID']
      @secret_access_key = ENV['AWS_SQS_SECRET_ACCESS_KEY']
      @region = ENV['AWS_REGION']
      @queue_url = ENV['AWS_SQS_QUEUE_URL']
      @origin = nil
    end
  end
end
