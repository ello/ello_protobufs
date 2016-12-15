# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#
require 'ello_protobufs/user.pb'
require 'ello_protobufs/post.pb'

module ElloProtobufs

  ##
  # Message Classes
  #
  class Watch < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class Watch
    required :uint32, :id, 1
    required ::ElloProtobufs::User, :user, 2
    required ::ElloProtobufs::Post, :post, 3
    required :uint64, :created_at, 4
    required :uint64, :updated_at, 5
  end

end

