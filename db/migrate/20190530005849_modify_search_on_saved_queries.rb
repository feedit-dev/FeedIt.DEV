class ModifySearchOnSavedQueries < ActiveRecord::Migration[5.2]
  def change
    remove_column :saved_queries, :search
    add_column :saved_queries, :search, :jsonb
  end
end
