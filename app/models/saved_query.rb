class SavedQuery < ApplicationRecord

  def self.save_with params:, request:
    self.create!(
      search: params,
      url: request.original_fullpath
    )
  end

end
