require 'config'
require 'aws-sdk-sqs'

module Inspectr
  FIELDS_TO_STRINGIFY = %i(
    actor
    target
    origin
    event
  ).freeze

  class Client
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
      @sqs.send_message({
        queue_url:        @queue_url,
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

  def self.publish(message)
    msg_hash = {
      actor: message[:actor],
      actorMetadata: message[:actor_metadata],
      target: message[:target],
      targetMetadata: message[:target_metadata],
      origin: configuration.origin,
      event: message[:event],
      timestamp: Time.now.utc.to_i
    }
    msg_hash = stringify_message(msg_hash)
    client.publish(msg_hash.to_json)
  end

  def self.stringify_message(msg_hash)
    msg_hash.map do |k, v|
      [k, FIELDS_TO_STRINGIFY.include?(k) && v ? v.to_s : v]
    end.to_h
  end
end
