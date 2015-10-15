class AddSlugsToPletools < ActiveRecord::Migration
  def change
    add_column :pletools, :slug, :string
    add_index :pletools, :slug, unique: true
  end
end
