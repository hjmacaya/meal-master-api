# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_19_025700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "in_bodies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "nutritionist_id", null: false
    t.float "height"
    t.float "weight"
    t.integer "age"
    t.string "genre"
    t.date "date"
    t.float "body_water"
    t.float "protein_mass"
    t.float "minerals_mass"
    t.float "body_fat"
    t.float "lean_mass"
    t.float "mass_free_of_fat"
    t.float "muscle_mass"
    t.float "imc"
    t.float "percentage_body_fat"
    t.float "right_arm"
    t.float "left_arm"
    t.float "trunk"
    t.float "right_leg"
    t.float "left_leg"
    t.float "aec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_in_bodies_on_nutritionist_id"
    t.index ["user_id"], name: "index_in_bodies_on_user_id"
  end

  create_table "nutritionists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.string "academic_title"
    t.string "company"
    t.string "jti", null: false
    t.index ["email"], name: "index_nutritionists_on_email", unique: true
    t.index ["jti"], name: "index_nutritionists_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_nutritionists_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "in_bodies", "nutritionists"
  add_foreign_key "in_bodies", "users"
end
