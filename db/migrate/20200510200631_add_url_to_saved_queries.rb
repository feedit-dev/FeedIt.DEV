class AddUrlToSavedQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :saved_queries, :url, :string
  end
end
