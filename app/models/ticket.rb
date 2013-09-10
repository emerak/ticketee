class Ticket < ActiveRecord::Base
  belongs_to :project
  has_many :assets
  accepts_nested_attributes_for :assets
end
