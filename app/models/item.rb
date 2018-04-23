class Item < ApplicationRecord
  belongs_to :list
  after_initialize :set_defaults

  def set_defaults
    self.completed = false if self.new_record?
  end
end
