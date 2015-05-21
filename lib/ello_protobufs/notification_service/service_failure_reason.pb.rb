# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'

module ElloProtobufs
  module NotificationService

    ##
    # Enum Classes
    #
    class ServiceFailureReason < ::Protobuf::Enum
      define :UNSPECIFIED_REASON, 0
      define :UNKNOWN_NOTIFICATION_TYPE, 1
      define :UNKNOWN_NOTIFICATION_PLATFORM, 2
      define :PLATFORM_COMMUNICATION_ERROR, 3
    end

  end

end

