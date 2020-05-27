class Image < ApplicationRecord
  validates_with ImageValidator
  acts_as_taggable_on :tags
end
