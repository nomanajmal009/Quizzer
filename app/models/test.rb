class Test < ApplicationRecord
    has_many :questions, dependent: :destroy, inverse_of: :test
    accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true


    validates :name, :presence => true
end
