class AddSearchesToSavedQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :saved_queries, :search, :json
  end
end
