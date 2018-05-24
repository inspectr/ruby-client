# ruby-client
Ruby client for Inspectr

# to build gem
```
gem build inspectr.gemspec
```

# to run tests
```
rake test
```

# Example usage
```
Inspectr.config do |c|
  c.access_key_id = ENV['AWS_SQS_ACCESS_KEY_ID']
  c.secret_access_key = ENV['AWS_SQS_SECRET_ACCESS_KEY']
  c.region = ENV['AWS_REGION']
  c.queue_url = ENV['AWS_SQS_QUEUE_URL']
end

actor = "john@doe.com"

actor_metadata = {
  type: "user",
  name: "John Doe",
  id: 123
}

target = 456

target_metadata = {
  type: "user",
  email: "bob@bob.com"
}

origin = "my_server"

origin_metadata = nil

event = "create_user"

event_metadata = {
  other_field: "value"
}

Inspectr.publish(
  actor: actor, 
  actor_metadata: actor_metadata, 
  target: target, 
  target_metadata: target_metadata, 
  origin: origin,
  event: event, 
  event_metadata: event_metadata)
```
