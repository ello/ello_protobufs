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
  class Comment < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class Comment
    required :uint32, :id, 1
    required ::ElloProtobufs::Post, :parent_post, 2
    required :string, :token, 3
    required ::ElloProtobufs::User, :author, 4
    required :uint64, :created_at, 5
    required :uint64, :updated_at, 6
  end

end

