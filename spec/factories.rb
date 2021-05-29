require 'securerandom'
require 'faker'

FactoryBot.define do
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
    deleted { false }
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
    post { create(:protobuf_post) }
    title { 'Artist Invite Title' }
    href { "notifications/artist-invites/my-slug" }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_category, class: ElloProtobufs::Category do
    skip_create
    id { generate(:protobuf_id) }
    title { 'Category Name' }
    slug { 'category_name' }
  end

  factory :protobuf_category_post, class: ElloProtobufs::CategoryPost do
    skip_create
    id { generate(:protobuf_id) }
    post { create(:protobuf_post) }
    category { create(:protobuf_category) }
    status { 'featured' }
    submitted_by { create(:protobuf_user) }
    submitted_at { Time.now.to_i }
    featured_by { create(:protobuf_user) }
    featured_at { Time.now.to_i }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end

  factory :protobuf_category_user, class: ElloProtobufs::CategoryUser do
    skip_create
    id { generate(:protobuf_id) }
    user { create(:protobuf_user) }
    category { create(:protobuf_category) }
    role { 'featured' }
    featured_by { create(:protobuf_user) }
    curator_by { create(:protobuf_user) }
    moderator_by { create(:protobuf_user) }
    created_at { Time.now.to_i }
    updated_at { Time.now.to_i }
  end
end
