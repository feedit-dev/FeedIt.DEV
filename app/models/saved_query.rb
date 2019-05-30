class SavedQuery < ApplicationRecord
  def self.save_by params
    self.create!(
      search: params
    )
  end
end
