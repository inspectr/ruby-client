module Inspectr
  class Client
    def self.initialize(access_key_id, secret_access_key, region, queue_url)
      @sqs = Aws::SQS::Client.new(
              access_key_id:     access_key_id,
              secret_access_key: secret_access_key,
              region:            region
            )
      @queue_url = queue_url
    end

    def publish(msg)
      @sqs.send_message({
              queue_url:    @queue_url,
              message_body: msg
            })
    end

    def self.talk
      "I am Inspectr"
    end
  end
end
