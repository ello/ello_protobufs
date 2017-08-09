require 'securerandom'
require 'faker'

FactoryGirl.define do
  sequence(:protobuf_id)

  factory :protobuf_user, class: ElloProtobufs::User do
    skip_create
    id { generate(:protobuf_id) }
    username { Faker::Internet.user_name(name, ['_']) }
    href { "http://ello.co/#{username}" }
    name { Faker::Name.name }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_post, class: ElloProtobufs::Post do
    skip_create
    id { generate(:protobuf_id) }
    token { SecureRandom.uuid }
    href { "http://ello.co/#{author.username}/#{token}" }
    author { create(:protobuf_user) }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }

    trait :repost do
      reposted_source { create(:protobuf_post) }
    end

    trait :reposted_repost do
      reposted_source { create(:protobuf_post) }
      reposted_via { create(:protobuf_post) }
    end
  end

  factory :protobuf_comment, class: ElloProtobufs::Comment do
    skip_create
    id { generate(:protobuf_id) }
    parent_post { create(:protobuf_post) }
    token { SecureRandom.uuid }
    author { create(:protobuf_user) }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_love, class: ElloProtobufs::Love do
    skip_create
    id { generate(:protobuf_id) }
    user { create(:protobuf_user) }
    post { create(:protobuf_post) }
    deleted false
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_watch, class: ElloProtobufs::Watch do
    skip_create
    id { generate(:protobuf_id) }
    user { create(:protobuf_user) }
    post { create(:protobuf_post) }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_announcement, class: ElloProtobufs::Announcement do
    skip_create
    id { generate(:protobuf_id) }
    header { "header" }
    body { "body" }
    cta_href { "http://asdf.com" }
    cta_caption { "asdf" }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_artist_invite_submission, class: ElloProtobufs::ArtistInviteSubmission do
    skip_create
    id { generate(:protobuf_id) }
    href { "http://ello.co/username1/asdf123" }
    post { create(:protobuf_post) }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end
end
