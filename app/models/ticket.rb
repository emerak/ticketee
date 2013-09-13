class Ticket < ActiveRecord::Base
  attr_accessor :tag_names
  belongs_to :project
  searcher do
    label :tag, :from => :tags, :field => :name
  end
  belongs_to :state
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  has_and_belongs_to_many :tags
  before_create :associate_tags
  private
  def associate_tags
    if tag_names
      tag_names.split(" ").each do |name|
        self.tags << Tag.find_or_create_by_name(name)
      end
    end
  end
end
