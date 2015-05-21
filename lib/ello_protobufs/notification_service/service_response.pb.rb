# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#
require 'ello_protobufs/notification_service/service_failure_reason.pb'

module ElloProtobufs
  module NotificationService

    ##
    # Message Classes
    #
    class ServiceResponse < ::Protobuf::Message; end


    ##
    # Message Fields
    #
    class ServiceResponse
      required :bool, :success, 1
      optional ::ElloProtobufs::NotificationService::ServiceFailureReason, :failure_reason, 2, :default => ::ElloProtobufs::NotificationService::ServiceFailureReason::UNSPECIFIED_REASON
      optional :string, :failure_details, 3
    end

  end

end

