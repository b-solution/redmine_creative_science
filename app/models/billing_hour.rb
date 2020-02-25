class BillingHour < ActiveRecord::Base
  unloadable

  belongs_to :project

  validates_presence_of :project_id, :time, :user_id
  validates_numericality_of :time, :greater_than => 0
end
