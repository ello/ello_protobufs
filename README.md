# Ello Proto Buffers

This gem includes the protobuf definitions and compiled protobuf data
transfer objects for the Ello domain.  The intent of this library
is to provide a common way to serialize/transfer Ello domain
objects between services.

For more information on Protocol Buffers, check the [Google Developer
resoruces](https://developers.google.com/protocol-buffers/).

## Installation

Add this line to the application's Gemfile:

```ruby
gem 'ello_protobufs'
```

And then execute:

```bash
$ bundle
```

## Usage

Once added to your `Gemfile`, the protobufs will be available under
the `ElloProtobufs` namespace.  Behind the scenes, we're using
[localshred/protobuf](https://github.com/localshred/protobuf) for
the actual protobuf serialization/deserialization.

The gem provides some FactoryGirl factories for testing purposes in
implementing applications.  These can be loaded into your project by
adding `ElloProtobufs.load_protobuf_factories` in your `spec_helper.rb`
or `rails_helper.rb`.

## Development Requirements

- Protobuf 2.5.0 -- `brew tap homebrew/versions && brew install protobuf`

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then run `bundle exec console` for an interactive prompt that will allow
you to experiment.

To regenerate definitions, run `rake ello_protobufs:compile`.  Sometimes
you need to clean the definitions, especially when prototyping new
messages that you rename multiple times.  To clean all definitions run
`rake ello_protobufs::clean`.  **NOTE:** Be sure to re-compile after a
clean as the clean deletes all defintions.

## Definition Organization

Protocol buffers are often used in tandem with a rich RPC server for
cross-service communication.  We have decided to opt-out of a generated
RPC server and instead have Rails operate as the server while still
having request/response objects for RPC calls.

The code organization convention that we're going with is:

```ruby
# parent namespace: contains primary domain objects, shared enums -- things used by multiple services
ElloProtobufs

# service namespace: contains service specific messages/enums and RPC request/response objects
ElloProtobufs::SomeSpecialService

# RPC request object to create a car using SomeSpecialService
ElloProtobufs::SomeSpecialService::CreateCarRequest

# RPC response object containing information about the creation of a car using SomeSpecialService
ElloProtobufs::SomeSpecialService::ServiceResponse

# service specific enum to specify the status of the car creation operation -- NOTE: this is preferable to text error messages as it's more discrete and doesn't require parsing
ElloProtobufs::SomeSpecialService::ServiceFailureReason
```

## Implementation Guide

Below is a simple example of how you might use this gem for
bi-directional communcation in a service.

```ruby
# config/initializers/protobuf.rb

Mime::Type.register 'application/octet-stream', :protobuf
```

```ruby
# config/routes.rb

Rails.application.routes.draw do
  post '/cars' => 'cars#create', as: :cars, defaults: { format: 'protobuf' }
end
```

```protobuf
/* definitions/ello_protobufs/car_service/create_car_request.proto */

package ElloProtobufs.CarService;

message CreateCarRequest {
  required string make = 1;
  required string model = 2;
  required uint32 year = 3;
}
```

```protobuf
/* definitions/ello_protobufs/car_service/create_car_response.proto */

package ElloProtobufs.CarService;

message CreateCarRequest {
  required bool success = 1;
  optional uint32 id = 2;
  optional ServiceFailureReason failure_reason = 3;
  repeated string errors = 4;
}
```

```protobuf
/* definitions/ello_protobufs/car_service/service_failure_reason.proto */

package ElloProtobufs.CarService;

enum ServiceFailureReason {
  UNSPECIFIED = 0;
  VALIDATION_FAILED = 1;
}
```

```ruby
# app/controllers/cars_controller.rb

class CarsController < ApplicationController

  def create
    request = ElloProtobufs::CarService::CreateCarRequest.decode_from(request.body)
    resp = ElloProtobufs::CarService::ServiceResponse.new

    car = Car.new(car_params(request))

    if car.save
      resp.success = true
      resp.id = car.id
    else
      resp.success = false
      if car.valid?
        resp.failure_reason = ElloProtobufs::CarService::ServiceFailureReason::UNSPECIFIED
      else
        resp.failure_reason = ElloProtobufs::CarService::ServiceFailureReason::VALIDATION_FAILED
        resp.errors = car.errors.full_messages
      end
    end

    send_data resp.encode, type: :protobuf
  end

  private

  def car_params(request)
    {
      make: request.make,
      model: request.model,
      year: request.year
    }
  end

end
```
