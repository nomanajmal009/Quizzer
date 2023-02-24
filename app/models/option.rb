class Option < ApplicationRecord
  belongs_to :test
  belongs_to :question
  attr_accessor :description, :is_true

  # validates :value, presence: true
  # validates :value, length: { maximum: 255,
  #     too_long: "%{count} characters is the maximum allowed" }
end