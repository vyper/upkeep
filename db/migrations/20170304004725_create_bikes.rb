Hanami::Model.migration do
  change do
    create_table :bikes do
      column :id, 'uuid', primary_key: true, default: Hanami::Model::Sql.function(:uuid_generate_v4)

      column :name,       String,   null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
