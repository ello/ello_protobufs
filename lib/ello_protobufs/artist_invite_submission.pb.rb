# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#
require 'ello_protobufs/post.pb'

module ElloProtobufs

  ##
  # Message Classes
  #
  class ArtistInviteSubmission < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class ArtistInviteSubmission
    required :uint32, :id, 1
    required :string, :title, 2
    required :string, :href, 3
    required :string, :author_username, 4
    required :uint64, :created_at, 5
    required :uint64, :updated_at, 6
  end

end
