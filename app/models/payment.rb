class Payment < ApplicationRecord
  belongs_to :user


  enum status: [:requested, :accepted, :error, :declined]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :requested
  end
end
