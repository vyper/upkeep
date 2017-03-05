Hanami::Model.migration do
  change do
    alter_table(:parts) do
      add_foreign_key :bike_id, :bikes, type: 'uuid', on_delete: :cascade, null: false
    end
  end
end
