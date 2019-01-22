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

ActiveRecord::Schema.define(version: 20180718193136) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_id",                 default: "", null: false
    t.string   "resource_type",               default: "", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "attempts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                                      null: false
    t.integer  "exercise_version_id",                          null: false
    t.datetime "submit_time",                                  null: false
    t.integer  "submit_num",                                   null: false
    t.float    "score",               limit: 24, default: 0.0
    t.integer  "experience_earned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workout_score_id"
    t.integer  "active_score_id"
    t.boolean  "feedback_ready"
    t.index ["active_score_id"], name: "index_attempts_on_active_score_id", using: :btree
    t.index ["exercise_version_id"], name: "index_attempts_on_exercise_version_id", using: :btree
    t.index ["user_id"], name: "index_attempts_on_user_id", using: :btree
    t.index ["workout_score_id"], name: "index_attempts_on_workout_score_id", using: :btree
  end

  create_table "attempts_tag_user_scores", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "attempt_id"
    t.integer "tag_user_score_id"
    t.index ["attempt_id", "tag_user_score_id"], name: "attempts_tag_user_scores_idx", unique: true, using: :btree
    t.index ["tag_user_score_id"], name: "attempts_tag_user_scores_tag_user_score_id_fk", using: :btree
  end

  create_table "choices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "multiple_choice_prompt_id",               null: false
    t.integer  "position",                                null: false
    t.text     "feedback",                  limit: 65535
    t.float    "value",                     limit: 24,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answer",                    limit: 65535, null: false
    t.index ["multiple_choice_prompt_id"], name: "index_choices_on_multiple_choice_prompt_id", using: :btree
  end

  create_table "choices_multiple_choice_prompt_answers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "choice_id"
    t.integer "multiple_choice_prompt_answer_id"
    t.index ["choice_id", "multiple_choice_prompt_answer_id"], name: "choices_multiple_choice_prompt_answers_idx", unique: true, using: :btree
    t.index ["multiple_choice_prompt_answer_id"], name: "choices_MC_prompt_answers_MC_prompt_answer_id_fk", using: :btree
  end

  create_table "coding_prompt_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text "answer", limit: 65535
    t.text "error",  limit: 65535
  end

  create_table "coding_prompts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "class_name"
    t.text     "wrapper_code",  limit: 65535,                 null: false
    t.text     "test_script",   limit: 65535,                 null: false
    t.string   "method_name"
    t.text     "starter_code",  limit: 65535
    t.boolean  "hide_examples",               default: false, null: false
  end

  create_table "course_enrollments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id",            null: false
    t.integer "course_offering_id", null: false
    t.integer "course_role_id",     null: false
    t.index ["course_offering_id"], name: "index_course_enrollments_on_course_offering_id", using: :btree
    t.index ["course_role_id"], name: "index_course_enrollments_on_course_role_id", using: :btree
    t.index ["user_id", "course_offering_id"], name: "index_course_enrollments_on_user_id_and_course_offering_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_course_enrollments_on_user_id", using: :btree
  end

  create_table "course_exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "course_id",   null: false
    t.integer  "exercise_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_id"], name: "course_exercises_course_id_fk", using: :btree
    t.index ["exercise_id"], name: "course_exercises_exercise_id_fk", using: :btree
  end

  create_table "course_offerings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "course_id",                            null: false
    t.integer  "term_id",                              null: false
    t.string   "label",                   default: "", null: false
    t.string   "url"
    t.boolean  "self_enrollment_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "cutoff_date"
    t.integer  "lms_instance_id"
    t.index ["course_id"], name: "index_course_offerings_on_course_id", using: :btree
    t.index ["lms_instance_id"], name: "index_course_offerings_on_lms_instance_id", using: :btree
    t.index ["term_id"], name: "index_course_offerings_on_term_id", using: :btree
  end

  create_table "course_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name",                       default: "",    null: false
    t.boolean "can_manage_course",          default: false, null: false
    t.boolean "can_manage_assignments",     default: false, null: false
    t.boolean "can_grade_submissions",      default: false, null: false
    t.boolean "can_view_other_submissions", default: false, null: false
    t.boolean "builtin",                    default: false, null: false
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",            default: "",    null: false
    t.string   "number",          default: "",    null: false
    t.integer  "organization_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "slug",            default: "",    null: false
    t.integer  "user_group_id"
    t.boolean  "is_hidden",       default: false
    t.index ["organization_id"], name: "index_courses_on_organization_id", using: :btree
    t.index ["slug"], name: "index_courses_on_slug", using: :btree
    t.index ["user_group_id"], name: "index_courses_on_user_group_id", using: :btree
  end

  create_table "errors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "usable_type"
    t.integer  "usable_id"
    t.string   "class_name"
    t.text     "message",     limit: 65535
    t.text     "trace",       limit: 65535
    t.text     "target_url",  limit: 65535
    t.text     "referer_url", limit: 65535
    t.text     "params",      limit: 65535
    t.text     "user_agent",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["class_name"], name: "index_errors_on_class_name", using: :btree
    t.index ["created_at"], name: "index_errors_on_created_at", using: :btree
  end

  create_table "exercise_collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",        limit: 65535
    t.integer  "user_group_id"
    t.integer  "license_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "course_offering_id"
    t.index ["course_offering_id"], name: "index_exercise_collections_on_course_offering_id", using: :btree
    t.index ["license_id"], name: "index_exercise_collections_on_license_id", using: :btree
    t.index ["user_group_id"], name: "index_exercise_collections_on_user_group_id", using: :btree
    t.index ["user_id"], name: "index_exercise_collections_on_user_id", using: :btree
  end

  create_table "exercise_families", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "exercise_id", null: false
    t.integer "owner_id",    null: false
    t.index ["exercise_id", "owner_id"], name: "index_exercise_owners_on_exercise_id_and_owner_id", unique: true, using: :btree
    t.index ["owner_id"], name: "exercise_owners_owner_id_fk", using: :btree
  end

  create_table "exercise_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "stem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exercise_id",                          null: false
    t.integer  "version",                              null: false
    t.integer  "creator_id"
    t.integer  "irt_data_id"
    t.text     "text_representation", limit: 16777215
    t.index ["creator_id"], name: "exercise_versions_creator_id_fk", using: :btree
    t.index ["exercise_id"], name: "index_exercise_versions_on_exercise_id", using: :btree
    t.index ["irt_data_id"], name: "exercise_versions_irt_data_id_fk", using: :btree
    t.index ["stem_id"], name: "index_exercise_versions_on_stem_id", using: :btree
  end

  create_table "exercise_versions_resource_files", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "exercise_version_id", null: false
    t.integer "resource_file_id",    null: false
    t.index ["exercise_version_id"], name: "index_exercise_versions_resource_files_on_exercise_version_id", using: :btree
    t.index ["resource_file_id"], name: "index_exercise_versions_resource_files_on_resource_file_id", using: :btree
  end

  create_table "exercise_workouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "exercise_id",                          null: false
    t.integer  "workout_id",                           null: false
    t.integer  "position",                             null: false
    t.float    "points",      limit: 24, default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["exercise_id"], name: "exercise_workouts_exercise_id_fk", using: :btree
    t.index ["workout_id"], name: "exercise_workouts_workout_id_fk", using: :btree
  end

  create_table "exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "question_type",                          null: false
    t.integer  "current_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "versions"
    t.integer  "exercise_family_id"
    t.string   "name"
    t.boolean  "is_public",              default: false, null: false
    t.integer  "experience",                             null: false
    t.integer  "irt_data_id"
    t.string   "external_id"
    t.integer  "exercise_collection_id"
    t.index ["current_version_id"], name: "index_exercises_on_current_version_id", using: :btree
    t.index ["exercise_collection_id"], name: "index_exercises_on_exercise_collection_id", using: :btree
    t.index ["exercise_family_id"], name: "index_exercises_on_exercise_family_id", using: :btree
    t.index ["external_id"], name: "index_exercises_on_external_id", unique: true, using: :btree
    t.index ["irt_data_id"], name: "exercises_irt_data_id_fk", using: :btree
    t.index ["is_public"], name: "index_exercises_on_is_public", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "slug",                      default: "", null: false
    t.integer  "sluggable_id",                           null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "global_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name",                          default: "",    null: false
    t.boolean "can_manage_all_courses",        default: false, null: false
    t.boolean "can_edit_system_configuration", default: false, null: false
    t.boolean "builtin",                       default: false, null: false
  end

  create_table "group_access_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.boolean  "pending",       default: true
    t.boolean  "decision"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_group_id"], name: "index_group_access_requests_on_user_group_id", using: :btree
    t.index ["user_id"], name: "index_group_access_requests_on_user_id", using: :btree
  end

  create_table "identities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                 null: false
    t.string   "provider",   default: "", null: false
    t.string   "uid",        default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["uid", "provider"], name: "index_identities_on_uid_and_provider", using: :btree
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "irt_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "attempt_count",             null: false
    t.float   "sum_of_scores",  limit: 24, null: false
    t.float   "difficulty",     limit: 24, null: false
    t.float   "discrimination", limit: 24, null: false
  end

  create_table "license_policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.boolean  "can_fork"
    t.boolean  "is_public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",       limit: 65535
    t.string   "url"
    t.integer  "license_policy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["license_policy_id"], name: "index_licenses_on_license_policy_id", using: :btree
  end

  create_table "lms_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "lms_type_id"
    t.integer  "organization_id"
    t.index ["lms_type_id"], name: "lms_instances_lms_type_id_fk", using: :btree
    t.index ["organization_id"], name: "index_lms_instances_on_organization_id", using: :btree
    t.index ["url"], name: "index_lms_instances_on_url", unique: true, using: :btree
  end

  create_table "lms_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_lms_types_on_name", unique: true, using: :btree
  end

  create_table "lti_identities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "lti_user_id"
    t.integer  "user_id"
    t.integer  "lms_instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lms_instance_id"], name: "index_lti_identities_on_lms_instance_id", using: :btree
    t.index ["user_id"], name: "index_lti_identities_on_user_id", using: :btree
  end

  create_table "memberships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_choice_prompt_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
  end

  create_table "multiple_choice_prompts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.boolean "allow_multiple", default: false, null: false
    t.boolean "is_scrambled",   default: true,  null: false
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",         default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
    t.string   "slug",         default: "",    null: false
    t.boolean  "is_hidden",    default: false
    t.index ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree
  end

  create_table "prompt_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "attempt_id"
    t.integer "prompt_id"
    t.integer "actable_id"
    t.string  "actable_type"
    t.index ["actable_id"], name: "index_prompt_answers_on_actable_id", using: :btree
    t.index ["attempt_id", "prompt_id"], name: "index_prompt_answers_on_attempt_id_and_prompt_id", unique: true, using: :btree
    t.index ["attempt_id"], name: "index_prompt_answers_on_attempt_id", using: :btree
    t.index ["prompt_id"], name: "index_prompt_answers_on_prompt_id", using: :btree
  end

  create_table "prompts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "exercise_version_id",               null: false
    t.text     "question",            limit: 65535, null: false
    t.integer  "position",                          null: false
    t.text     "feedback",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.integer  "irt_data_id"
    t.index ["actable_id"], name: "index_prompts_on_actable_id", using: :btree
    t.index ["exercise_version_id"], name: "index_prompts_on_exercise_version_id", using: :btree
    t.index ["irt_data_id"], name: "prompts_irt_data_id_fk", using: :btree
  end

  create_table "resource_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "filename"
    t.string   "token",      default: "",   null: false
    t.integer  "user_id",                   null: false
    t.boolean  "public",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_resource_files_on_token", using: :btree
    t.index ["user_id"], name: "index_resource_files_on_user_id", using: :btree
  end

  create_table "signups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "first_name"
    t.string   "last_name_name"
    t.string   "email"
    t.string   "institution"
    t.text     "comments",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "preamble",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_extensions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "workout_offering_id"
    t.datetime "soft_deadline"
    t.datetime "hard_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_limit"
    t.datetime "opening_date"
    t.index ["user_id"], name: "index_student_extensions_on_user_id", using: :btree
    t.index ["workout_offering_id"], name: "index_student_extensions_on_workout_offering_id", using: :btree
  end

  create_table "tag_user_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                         null: false
    t.integer  "experience",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completed_exercises", default: 0
    t.index ["user_id"], name: "index_tag_user_scores_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "season",                  null: false
    t.date     "starts_on",               null: false
    t.date     "ends_on",                 null: false
    t.integer  "year",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       default: "", null: false
    t.index ["slug"], name: "index_terms_on_slug", unique: true, using: :btree
    t.index ["year", "season"], name: "index_terms_on_year_and_season", using: :btree
  end

  create_table "test_case_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "test_case_id",                          null: false
    t.integer  "user_id",                               null: false
    t.text     "execution_feedback",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pass",                                  null: false
    t.integer  "coding_prompt_answer_id"
    t.index ["coding_prompt_answer_id"], name: "index_test_case_results_on_coding_prompt_answer_id", using: :btree
    t.index ["test_case_id"], name: "index_test_case_results_on_test_case_id", using: :btree
    t.index ["user_id"], name: "index_test_case_results_on_user_id", using: :btree
  end

  create_table "test_cases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "negative_feedback", limit: 65535
    t.float    "weight",            limit: 24,                    null: false
    t.text     "description",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coding_prompt_id",                                null: false
    t.text     "input",             limit: 65535,                 null: false
    t.text     "expected_output",   limit: 65535,                 null: false
    t.boolean  "static",                          default: false, null: false
    t.boolean  "screening",                       default: false, null: false
    t.boolean  "example",                         default: false, null: false
    t.boolean  "hidden",                          default: false, null: false
    t.index ["coding_prompt_id"], name: "index_test_cases_on_coding_prompt_id", using: :btree
  end

  create_table "time_zones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "zone"
    t.string   "display_as"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description", limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "global_role_id",                        null: false
    t.string   "avatar"
    t.string   "slug",                     default: "", null: false
    t.integer  "current_workout_score_id"
    t.integer  "time_zone_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["current_workout_score_id"], name: "index_users_on_current_workout_score_id", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["global_role_id"], name: "index_users_on_global_role_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
    t.index ["time_zone_id"], name: "index_users_on_time_zone_id", using: :btree
  end

  create_table "visualization_loggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.integer  "workout_offering_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["exercise_id"], name: "index_visualization_loggings_on_exercise_id", using: :btree
    t.index ["user_id"], name: "index_visualization_loggings_on_user_id", using: :btree
    t.index ["workout_id"], name: "index_visualization_loggings_on_workout_id", using: :btree
    t.index ["workout_offering_id"], name: "index_visualization_loggings_on_workout_offering_id", using: :btree
  end

  create_table "workout_offerings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "course_offering_id",                      null: false
    t.integer  "workout_id",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "opening_date"
    t.datetime "soft_deadline"
    t.datetime "hard_deadline"
    t.boolean  "published",                default: true, null: false
    t.integer  "time_limit"
    t.integer  "workout_policy_id"
    t.integer  "continue_from_workout_id"
    t.string   "lms_assignment_id"
    t.boolean  "most_recent",              default: true
    t.string   "lms_assignment_url"
    t.index ["continue_from_workout_id"], name: "workout_offerings_continue_from_workout_id_fk", using: :btree
    t.index ["course_offering_id"], name: "index_workout_offerings_on_course_offering_id", using: :btree
    t.index ["lms_assignment_id"], name: "index_workout_offerings_on_lms_assignment_id", using: :btree
    t.index ["workout_id"], name: "index_workout_offerings_on_workout_id", using: :btree
    t.index ["workout_policy_id"], name: "index_workout_offerings_on_workout_policy_id", using: :btree
  end

  create_table "workout_owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "workout_id", null: false
    t.integer "owner_id",   null: false
    t.index ["owner_id"], name: "workout_owners_owner_id_fk", using: :btree
    t.index ["workout_id", "owner_id"], name: "index_workout_owners_on_workout_id_and_owner_id", unique: true, using: :btree
  end

  create_table "workout_policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.boolean  "hide_thumbnails_before_start"
    t.boolean  "hide_feedback_before_finish"
    t.boolean  "hide_compilation_feedback_before_finish"
    t.boolean  "no_review_before_close"
    t.boolean  "hide_feedback_in_review_before_close"
    t.boolean  "hide_thumbnails_in_review_before_close"
    t.boolean  "no_hints"
    t.boolean  "no_faq"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "invisible_before_review"
    t.string   "description"
  end

  create_table "workout_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "workout_id",                         null: false
    t.integer  "user_id",                            null: false
    t.float    "score",                   limit: 24
    t.boolean  "completed"
    t.datetime "completed_at"
    t.datetime "last_attempted_at"
    t.integer  "exercises_completed"
    t.integer  "exercises_remaining"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workout_offering_id"
    t.string   "lis_outcome_service_url"
    t.string   "lis_result_sourcedid"
    t.index ["user_id"], name: "index_workout_scores_on_user_id", using: :btree
    t.index ["workout_id"], name: "index_workout_scores_on_workout_id", using: :btree
    t.index ["workout_offering_id"], name: "workout_scores_workout_offering_id_fk", using: :btree
  end

  create_table "workouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                            default: "",    null: false
    t.boolean  "scrambled",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",       limit: 65535
    t.integer  "points_multiplier"
    t.integer  "creator_id"
    t.string   "external_id"
    t.boolean  "is_public"
    t.index ["creator_id"], name: "workouts_creator_id_fk", using: :btree
    t.index ["external_id"], name: "index_workouts_on_external_id", unique: true, using: :btree
    t.index ["is_public"], name: "index_workouts_on_is_public", using: :btree
  end

  add_foreign_key "attempts", "exercise_versions", name: "attempts_exercise_version_id_fk"
  add_foreign_key "attempts", "users", name: "attempts_user_id_fk"
  add_foreign_key "attempts", "workout_scores", column: "active_score_id", name: "attempts_active_score_id_fk"
  add_foreign_key "attempts", "workout_scores", name: "attempts_workout_score_id_fk"
  add_foreign_key "attempts_tag_user_scores", "attempts", name: "attempts_tag_user_scores_attempt_id_fk"
  add_foreign_key "attempts_tag_user_scores", "tag_user_scores", name: "attempts_tag_user_scores_tag_user_score_id_fk"
  add_foreign_key "choices", "multiple_choice_prompts", name: "choices_multiple_choice_prompt_id_fk"
  add_foreign_key "choices_multiple_choice_prompt_answers", "choices", name: "choices_multiple_choice_prompt_answers_choice_id_fk"
  add_foreign_key "choices_multiple_choice_prompt_answers", "multiple_choice_prompt_answers", name: "choices_MC_prompt_answers_MC_prompt_answer_id_fk"
  add_foreign_key "course_enrollments", "course_offerings", name: "course_enrollments_course_offering_id_fk"
  add_foreign_key "course_enrollments", "course_roles", name: "course_enrollments_course_role_id_fk"
  add_foreign_key "course_enrollments", "users", name: "course_enrollments_user_id_fk"
  add_foreign_key "course_exercises", "courses", name: "course_exercises_course_id_fk"
  add_foreign_key "course_exercises", "exercises", name: "course_exercises_exercise_id_fk"
  add_foreign_key "course_offerings", "courses", name: "course_offerings_course_id_fk"
  add_foreign_key "course_offerings", "terms", name: "course_offerings_term_id_fk"
  add_foreign_key "courses", "organizations", name: "courses_organization_id_fk"
  add_foreign_key "exercise_owners", "exercises", name: "exercise_owners_exercise_id_fk"
  add_foreign_key "exercise_owners", "users", column: "owner_id", name: "exercise_owners_owner_id_fk"
  add_foreign_key "exercise_versions", "exercises", name: "exercise_versions_exercise_id_fk"
  add_foreign_key "exercise_versions", "irt_data", column: "irt_data_id", name: "exercise_versions_irt_data_id_fk"
  add_foreign_key "exercise_versions", "stems", name: "exercise_versions_stem_id_fk"
  add_foreign_key "exercise_versions", "users", column: "creator_id", name: "exercise_versions_creator_id_fk"
  add_foreign_key "exercise_versions_resource_files", "exercise_versions", name: "exercise_versions_resource_files_exercise_version_id_fk"
  add_foreign_key "exercise_versions_resource_files", "resource_files", name: "exercise_versions_resource_files_resource_file_id_fk"
  add_foreign_key "exercise_workouts", "exercises", name: "exercise_workouts_exercise_id_fk"
  add_foreign_key "exercise_workouts", "workouts", name: "exercise_workouts_workout_id_fk"
  add_foreign_key "exercises", "exercise_families", name: "exercises_exercise_family_id_fk"
  add_foreign_key "exercises", "exercise_versions", column: "current_version_id", name: "exercises_current_version_id_fk"
  add_foreign_key "exercises", "irt_data", column: "irt_data_id", name: "exercises_irt_data_id_fk"
  add_foreign_key "identities", "users", name: "identities_user_id_fk"
  add_foreign_key "lms_instances", "lms_types", name: "lms_instances_lms_type_id_fk"
  add_foreign_key "prompt_answers", "attempts", name: "prompt_answers_attempt_id_fk"
  add_foreign_key "prompt_answers", "prompts", name: "prompt_answers_prompt_id_fk"
  add_foreign_key "prompts", "exercise_versions", name: "prompts_exercise_version_id_fk"
  add_foreign_key "prompts", "irt_data", column: "irt_data_id", name: "prompts_irt_data_id_fk"
  add_foreign_key "resource_files", "users", name: "resource_files_user_id_fk"
  add_foreign_key "student_extensions", "users", name: "student_extensions_user_id_fk"
  add_foreign_key "student_extensions", "workout_offerings", name: "student_extensions_workout_offering_id_fk"
  add_foreign_key "tag_user_scores", "users", name: "tag_user_scores_user_id_fk"
  add_foreign_key "test_case_results", "coding_prompt_answers", name: "test_case_results_coding_prompt_answer_id_fk"
  add_foreign_key "test_case_results", "test_cases", name: "test_case_results_test_case_id_fk"
  add_foreign_key "test_case_results", "users", name: "test_case_results_user_id_fk"
  add_foreign_key "test_cases", "coding_prompts", name: "test_cases_coding_prompt_id_fk"
  add_foreign_key "users", "global_roles", name: "users_global_role_id_fk"
  add_foreign_key "users", "time_zones", name: "users_time_zone_id_fk"
  add_foreign_key "users", "workout_scores", column: "current_workout_score_id", name: "users_current_workout_score_id_fk"
  add_foreign_key "workout_offerings", "course_offerings", name: "workout_offerings_course_offering_id_fk"
  add_foreign_key "workout_offerings", "workout_offerings", column: "continue_from_workout_id", name: "workout_offerings_continue_from_workout_id_fk"
  add_foreign_key "workout_offerings", "workout_policies", name: "workout_offerings_workout_policy_id_fk"
  add_foreign_key "workout_offerings", "workouts", name: "workout_offerings_workout_id_fk"
  add_foreign_key "workout_owners", "users", column: "owner_id", name: "workout_owners_owner_id_fk"
  add_foreign_key "workout_owners", "workouts", name: "workout_owners_workout_id_fk"
  add_foreign_key "workout_scores", "users", name: "workout_scores_user_id_fk"
  add_foreign_key "workout_scores", "workout_offerings", name: "workout_scores_workout_offering_id_fk"
  add_foreign_key "workout_scores", "workouts", name: "workout_scores_workout_id_fk"
  add_foreign_key "workouts", "users", column: "creator_id", name: "workouts_creator_id_fk"
end
