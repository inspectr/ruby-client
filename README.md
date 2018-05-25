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
  c.access_key_id = ENV['INSPECTR_AWS_ACCESS_KEY_ID']
  c.secret_access_key = ENV['INSPECTR_AWS_SECRET_ACCESS_KEY']
  c.region = ENV['INSPECTR_AWS_REGION']
  c.queue_url = ENV['INSPECTR_AWS_SQS_QUEUE_URL']
  c.origin = 'my-service'
end

actor = "john@doe.com"

actor_metadata = {
  type: "user",
  name: "John Doe",
  id: 123
}

target = "jane@doe.com"

target_metadata = {
  type: "user",
  name: "Jane Doe"
  id: 321
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
