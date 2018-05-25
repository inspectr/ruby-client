require 'config'
require 'aws-sdk-sqs'

module Inspectr
  class Client
    attr_reader :sqs, :queue_url

    MESSAGE_GROUP_ID = 'inspectr'.freeze

    def initialize(configuration)
      @sqs = Aws::SQS::Client.new(
        access_key_id:     configuration.access_key_id,
        secret_access_key: configuration.secret_access_key,
        region:            configuration.region,
      )
      @queue_url = configuration.queue_url
    end

    def publish(msg)
      sqs.send_message({
              queue_url:        queue_url,
              message_group_id: MESSAGE_GROUP_ID,
              message_body:     msg
            })
    end
  end

  def self.config
    yield configuration
  end

  def self.configuration
    @configuration ||= Config.new
  end

  def self.client
    @client ||= Client.new(configuration)
  end

  def self.publish(msg)
    client.publish(msg.merge(timestamp: Time.now.utc.to_i))
  end
end
