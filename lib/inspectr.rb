require 'config'
require 'aws-sdk-sqs'

module Inspectr
  class Client
    attr_reader :sqs, :queue_url

    def initialize
      @sqs = Aws::SQS::Client.new(
        access_key_id:     configuration.access_key_id,
        secret_access_key: configuration.secret_access_key,
        region:            configuration.region,
            )
      @queue_url = configuration.queue_url
    end

    def publish(msg)
      sqs.send_message({
              queue_url:    queue_url,
              message_group_id: 'inspectr',
              message_body: msg
            })
    end

    def configuration
      Inspectr.configuration
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.config
    yield configure
  end

  def self.configure
    self.configuration ||= Config.new
  end

  def self.client
    @client ||= Client.new
  end

  def self.publish(msg)
    client.publish(msg)
  end
end
