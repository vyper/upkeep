Hanami::Model.migration do
  change do
    alter_table :bikes do
      add_foreign_key :user_id, :users, type: 'uuid', on_delete: :cascade, null: false
    end
  end
end
