class Test < ApplicationRecord
    has_many :questions
    has_many :options

    accepts_nested_attributes_for :questions
    accepts_nested_attributes_for :options
    attr_accessor :questions_attributes,
                    :options_attributes

    validates :name, :presence => true

      # validates :name, :upc, :available_on, presence: true
    # validates :name, :upc, uniqueness: true
    # validates :upc, numericality: { only_integer: true }

    # validates :name, length: { maximum: 1024,
    #     too_long: "%{count} characters is the maximum allowed" }


    # validate :check_length


    # def check_length
    #     unless upc.size == 10 or upc.size == 12 or upc.size == 13
    #       errors.add(:upc, "length must be 10, 12, or 13 characters")
    #     end
    #   end
    
    #   validate :expiration_date_cannot_be_in_the_past
    
    #   def expiration_date_cannot_be_in_the_past
    #     errors.add(:available_on, "must be a future date") if
    #       !available_on.blank? and available_on < Date.today
    #   end
    
    # end
    
end
