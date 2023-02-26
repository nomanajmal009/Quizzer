class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy, inverse_of: :question

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, :presence => true
end