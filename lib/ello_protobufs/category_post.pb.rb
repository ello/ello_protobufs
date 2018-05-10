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
require 'ello_protobufs/category.pb'

module ElloProtobufs

  ##
  # Message Classes
  #
  class CategoryPost < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class CategoryPost
    required :uint32, :id, 1
    required :string, :status, 2
    required ::ElloProtobufs::Post, :post, 3
    required ::ElloProtobufs::Category, :category, 4
    required ::ElloProtobufs::User, :submitted_by, 5
    required :uint64, :submitted_at, 6
    optional ::ElloProtobufs::User, :featured_by, 7
    optional :uint64, :featured_at, 8
    required :uint64, :created_at, 9
    required :uint64, :updated_at, 10
  end

end

