class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  attr_accessor :name,
                  :description,
                  :options_attributes
  
  
  # validates :property_name, presence: true
  # validates :property_name, uniqueness: true
  # validates :property_name, length: { maximum: 255,
  #     too_long: "%{count} characters is the maximum allowed" }
  # end
end