# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#
require 'ello_protobufs/topic_type.pb'
require 'ello_protobufs/announcement.pb'

module ElloProtobufs
  module NotificationService

    ##
    # Message Classes
    #
    class CreateTopicNotificationRequest < ::Protobuf::Message; end


    ##
    # Message Fields
    #
    class CreateTopicNotificationRequest
      required ::ElloProtobufs::TopicType, :topic, 1, :default => ::ElloProtobufs::TopicType::ANNOUNCEMENT_TOPIC
      required ::ElloProtobufs::Announcement, :announcement, 2
    end

  end

end

