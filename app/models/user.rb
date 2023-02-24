class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, :presence => true
  validates :role, :presence => true
  validates :password, :confirmation =>true

  enum role: [:teacher, :student]


  def user_name
      return self.email.split('@').first
  end

  def teacher?
    self.role == 'teacher'
  end

  def student?
    self.role == 'student'
  end
end
