Hanami::Model.migration do
  change do
    create_table :users do
      column :id, 'uuid', primary_key: true, default: Hanami::Model::Sql.function(:uuid_generate_v4)

      column :firstname,  String,   null: false
      column :lastname,   String,   null: false
      column :email,      String,   null: false
      column :provider,   String,   null: false
      column :uid,        String,   null: false
      column :code,       String,   null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index [:provider, :uid], unique: true
      index :email,            unique: true
    end
  end
end
