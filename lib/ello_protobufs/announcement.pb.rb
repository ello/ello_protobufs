# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'


##
# Imports
#

module ElloProtobufs

  ##
  # Message Classes
  #
  class Announcement < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class Announcement
  required :uint32, :id, 1;
  required :string, :header, 2;
  required :string, :body, 3;
  required :string, :cta_href, 4;
  required :string, :cta_caption, 5;
  required :uint64, :created_at, 6;
  required :uint64, :updated_at, 7;
  end

end

