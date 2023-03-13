class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy, inverse_of: :question

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, :options, :have_at_least_one_marked_option, :presence => true

  private
   def have_at_least_one_marked_option
      self.options.each do |option|
        return true if option.is_true?
      end
      return false
   end
end