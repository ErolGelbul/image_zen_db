Table "users" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "updated_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "username" VARCHAR(30) [not null]
  "bio" VARCHAR(400)
  "avatar" VARCHAR(200)
  "phone" VARCHAR(25)
  "email" VARCHAR(40)
  "password" VARCHAR(50)
  "status" VARCHAR(15)
}

Table "posts" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "updated_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "url" VARCHAR(200) [not null]
  "caption" VARCHAR(240)
  "lat" REAL
  "lng" REAL
  "user_id" INTEGER [not null]
}

Table "comments" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "updated_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "contents" VARCHAR(240) [not null]
  "user_id" INTEGER [not null]
  "post_id" INTEGER [not null]
}

Table "likes" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "user_id" INTEGER [unique, not null]
  "post_id" INTEGER [unique]
  "comment_id" INTEGER [unique]
}

Table "photo_tags" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "updated_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "user_id" INTEGER [unique, not null]
  "post_id" INTEGER [unique, not null]
  "x" INTEGER [not null]
  "y" INTEGER [not null]
}

Table "caption_tags" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "user_id" INTEGER [unique, not null]
  "post_id" INTEGER [unique, not null]
}

Table "hashtags" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "title" VARCHAR(20) [unique, not null]
}

Table "hashtags_posts" {
  "id" SERIAL [pk, increment]
  "hashtag_id" INTEGER [unique, not null]
  "post_id" INTEGER [unique, not null]
}

Table "followers" {
  "id" SERIAL [pk, increment]
  "created_at" timestamp [default: `CURRENT_TIMESTAMP`]
  "leader_id" INTEGER [unique, not null]
  "follower_id" INTEGER [unique, not null]
}

Ref:"users"."id" < "posts"."user_id" [delete: cascade]

Ref:"users"."id" < "comments"."user_id" [delete: cascade]

Ref:"posts"."id" < "comments"."post_id" [delete: cascade]

Ref:"users"."id" < "likes"."user_id" [delete: cascade]

Ref:"posts"."id" < "likes"."post_id" [delete: cascade]

Ref:"comments"."id" < "likes"."comment_id" [delete: cascade]

Ref:"users"."id" < "photo_tags"."user_id" [delete: cascade]

Ref:"posts"."id" < "photo_tags"."post_id" [delete: cascade]

Ref:"users"."id" < "caption_tags"."user_id" [delete: cascade]

Ref:"posts"."id" < "caption_tags"."post_id" [delete: cascade]

Ref:"hashtags"."id" < "hashtags_posts"."hashtag_id" [delete: cascade]

Ref:"posts"."id" < "hashtags_posts"."post_id" [delete: cascade]

Ref:"users"."id" < "followers"."leader_id" [delete: cascade]

Ref:"users"."id" < "followers"."follower_id" [delete: cascade]