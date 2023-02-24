class Question < ApplicationRecord
  belongs_to :test
  has_many :options
  accepts_nested_attributes_for :options
  attr_accessor :name,
                  :description,
                  :options_attributes
  
  
  # validates :property_name, presence: true
  # validates :property_name, uniqueness: true
  # validates :property_name, length: { maximum: 255,
  #     too_long: "%{count} characters is the maximum allowed" }
  # end
end