Hanami::Model.migration do
  change do
    add_column :bikes, :type, String, null: false, default: 'none'
  end
end
