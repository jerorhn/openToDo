class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  after_initialize :set_defaults

  def set_defaults
    self.private = false if self.new_record?
  end
end
