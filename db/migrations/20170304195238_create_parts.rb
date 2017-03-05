Hanami::Model.migration do
  change do
    create_table :parts do
      column :id, 'uuid', primary_key: true, default: Hanami::Model::Sql.function(:uuid_generate_v4)

      foreign_key :type_id, :part_types, type: 'uuid', on_delete: :cascade, null: false

      column :name,       String,   null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
