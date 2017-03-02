# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170302092438) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "name_long"
  end

  create_table "formats", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "movie_countries", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "movie_countries", ["country_id"], name: "index_movie_countries_on_country_id"
  add_index "movie_countries", ["movie_id"], name: "index_movie_countries_on_movie_id"

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "movie_genres", ["genre_id"], name: "index_movie_genres_on_genre_id"
  add_index "movie_genres", ["movie_id"], name: "index_movie_genres_on_movie_id"

  create_table "movie_languages", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "movie_languages", ["language_id"], name: "index_movie_languages_on_language_id"
  add_index "movie_languages", ["movie_id"], name: "index_movie_languages_on_movie_id"

  create_table "movie_people", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "job_id"
  end

  add_index "movie_people", ["job_id"], name: "index_movie_people_on_job_id"
  add_index "movie_people", ["movie_id"], name: "index_movie_people_on_movie_id"
  add_index "movie_people", ["person_id"], name: "index_movie_people_on_person_id"

  create_table "movie_subtitles", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "subtitle_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "movie_subtitles", ["movie_id"], name: "index_movie_subtitles_on_movie_id"
  add_index "movie_subtitles", ["subtitle_id"], name: "index_movie_subtitles_on_subtitle_id"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.date     "released"
    t.integer  "runtime"
    t.text     "plot"
    t.float    "rating"
    t.date     "added"
    t.boolean  "watched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "format_id"
  end

  add_index "movies", ["format_id"], name: "index_movies_on_format_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtitles", force: :cascade do |t|
    t.string "name"
  end

end
