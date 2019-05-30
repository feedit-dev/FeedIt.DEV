class CreateSavedQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_queries do |t|
      t.timestamps
    end
  end
end
