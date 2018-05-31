# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'

module ElloProtobufs

  ##
  # Enum Classes
  #
  class NotificationType < ::Protobuf::Enum
    define :UNSPECIFIED_TYPE, 0
    define :COMMENT_MENTION, 1
    define :FOLLOWER, 2
    define :INVITE_REDEMPTION, 3
    define :POST_COMMENT, 4
    define :POST_MENTION, 5
    define :REPOST, 6
    define :REPOST_COMMENT_TO_ORIGINAL_AUTHOR, 7
    define :REPOST_COMMENT_TO_REPOST_AUTHOR, 8
    define :POST_LOVE, 9
    define :REPOST_LOVE_TO_ORIGINAL_AUTHOR, 10
    define :REPOST_LOVE_TO_REPOST_AUTHOR, 11
    define :RESET_BADGE_COUNT, 12
    define :POST_WATCH, 13
    define :REPOST_WATCH_TO_ORIGINAL_AUTHOR, 14
    define :REPOST_WATCH_TO_REPOST_AUTHOR, 15
    define :POST_COMMENT_TO_WATCHER, 16
    define :ANNOUNCEMENT, 17
    define :ARTIST_INVITE_SUBMISSION_APPROVED, 18
    define :APPROVED_ARTIST_INVITE_SUBMISSION_FOR_FOLLOWERS, 19
    define :FEATURED_CATEGORY_POST, 20
    define :FEATURED_CATEGORY_REPOST, 21
    define :FEATURED_CATEGORY_POST_VIA_REPOST, 22
    define :USER_ADDED_AS_FEATURED, 23
    define :USER_ADDED_AS_CURATOR, 24
    define :USER_ADDED_AS_MODERATOR, 25
  end

end

