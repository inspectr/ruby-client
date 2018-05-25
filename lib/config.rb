module Inspectr
  class Config
    attr_accessor :queue_url, :access_key_id, :secret_access_key, :region, :origin

    def initialize
      @access_key_id = ENV['INSPECTR_AWS_ACCESS_KEY_ID']
      @secret_access_key = ENV['INSPECTR_AWS_SECRET_ACCESS_KEY']
      @region = ENV['INSPECTR_AWS_REGION']
      @queue_url = ENV['INSPECTR_AWS_SQS_QUEUE_URL']
      @origin = nil
    end
  end
end
