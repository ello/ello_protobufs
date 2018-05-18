# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#
require 'ello_protobufs/user.pb'
require 'ello_protobufs/category.pb'

module ElloProtobufs

  ##
  # Message Classes
  #
  class CategoryUser < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class CategoryUser
    required :uint32, :id, 1
    required :string, :role, 2
    required ::ElloProtobufs::User, :user, 3
    required ::ElloProtobufs::Category, :category, 4
    required :uint64, :created_at, 5
    required :uint64, :updated_at, 6
    required ::ElloProtobufs::User, :featured_by, 7
    required ::ElloProtobufs::User, :curator_by, 8
    required ::ElloProtobufs::User, :moderator_by, 9
  end

end
