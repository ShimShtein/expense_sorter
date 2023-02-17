class AddSourceTypeToSource < ActiveRecord::Migration[7.0]
  def change
    add_column :sources, :source_type, :string
  end
end
