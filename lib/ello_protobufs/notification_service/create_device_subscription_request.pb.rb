# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#
require 'ello_protobufs/notification_platform.pb'

module ElloProtobufs
  module NotificationService

    ##
    # Message Classes
    #
    class CreateDeviceSubscriptionRequest < ::Protobuf::Message; end


    ##
    # Message Fields
    #
    class CreateDeviceSubscriptionRequest
      required ::ElloProtobufs::NotificationPlatform, :platform, 1, :default => ::ElloProtobufs::NotificationPlatform::UNSPECIFIED_PLATFORM
      required :string, :bundle_identifier, 2
      required :string, :platform_device_identifier, 3
      required :uint32, :logged_in_user_id, 4
    end

  end

end

