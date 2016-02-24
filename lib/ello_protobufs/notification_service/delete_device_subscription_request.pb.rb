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
    class DeleteDeviceSubscriptionRequest < ::Protobuf::Message; end


    ##
    # Message Fields
    #
    class DeleteDeviceSubscriptionRequest
      required ::ElloProtobufs::NotificationPlatform, :platform, 1, :default => ::ElloProtobufs::NotificationPlatform::UNSPECIFIED_PLATFORM
      required :string, :bundle_identifier, 2
      required :string, :platform_device_identifier, 3
      optional :uint32, :logged_in_user_id, 4
      optional :string, :marketing_version, 5
      optional :string, :build_version, 6
    end

  end

end

