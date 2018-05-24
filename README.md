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

#Example usage
```
inspectr = Inspectr::Client.new

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

inspectr.log(actor: actor, actor_metadata: actor_metadata, target: target, target_metadata: target_metadata, orign: origin, event: event, event_metadata: event_metadata)
```