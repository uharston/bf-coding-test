# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_11_171729) do

  create_table "medical_insurance_plans", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "product_name"
    t.string "group_rating"
    t.string "zero_eighteen"
    t.string "nineteen_twenty"
    t.string "twenty_one"
    t.string "twenty_two"
    t.string "twenty_three"
    t.string "twenty_four"
    t.string "twenty_five"
    t.string "twenty_six"
    t.string "twenty_seven"
    t.string "twenty_eight"
    t.string "twenty_nine"
    t.string "thirty_one"
    t.string "thirty_two"
    t.string "thirty_three"
    t.string "thirty_four"
    t.string "thirty_five"
    t.string "thirty_six"
    t.string "thirty_seven"
    t.string "thirty_eight"
    t.string "thirty_nine"
    t.string "forty"
    t.string "forty_one"
    t.string "forty_two"
    t.string "forty_three"
    t.string "forty_four"
    t.string "forty_five"
    t.string "forty_six"
    t.string "forty_seven"
    t.string "forty_eight"
    t.string "forty_nine"
    t.string "fifty"
    t.string "fifty_one"
    t.string "fifty_two"
    t.string "fifty_three"
    t.string "fifty_four"
    t.string "fifty_five"
    t.string "fifty_six"
    t.string "fifty_seven"
    t.string "fifty_eight"
    t.string "fifty_nine"
    t.string "sixty"
    t.string "sixty_one"
    t.string "sixty_two"
    t.string "sixty_three"
    t.string "sixty_four"
    t.string "sixty_five_plus"
    t.string "thirty"
  end

end
