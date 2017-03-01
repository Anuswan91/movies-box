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

ActiveRecord::Schema.define(version: 20170228214038) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "name_long"
  end

  create_table "countries_movies", id: false, force: :cascade do |t|
    t.integer "movie_id",   null: false
    t.integer "country_id", null: false
  end

  add_index "countries_movies", ["country_id"], name: "index_countries_movies_on_country_id"
  add_index "countries_movies", ["movie_id"], name: "index_countries_movies_on_movie_id"

  create_table "formats", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
  end

  add_index "genres_movies", ["genre_id"], name: "index_genres_movies_on_genre_id"
  add_index "genres_movies", ["movie_id"], name: "index_genres_movies_on_movie_id"

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "languages_movies", id: false, force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "language_id", null: false
  end

  add_index "languages_movies", ["language_id"], name: "index_languages_movies_on_language_id"
  add_index "languages_movies", ["movie_id"], name: "index_languages_movies_on_movie_id"

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

  create_table "movies_persons", id: false, force: :cascade do |t|
    t.integer "movie_id",  null: false
    t.integer "person_id", null: false
  end

  add_index "movies_persons", ["movie_id"], name: "index_movies_persons_on_movie_id"
  add_index "movies_persons", ["person_id"], name: "index_movies_persons_on_person_id"

  create_table "movies_subtitles", id: false, force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "subtitle_id", null: false
  end

  add_index "movies_subtitles", ["movie_id"], name: "index_movies_subtitles_on_movie_id"
  add_index "movies_subtitles", ["subtitle_id"], name: "index_movies_subtitles_on_subtitle_id"

  create_table "persons", force: :cascade do |t|
    t.string "name"
  end

  create_table "subtitles", force: :cascade do |t|
    t.string "name"
  end

end
