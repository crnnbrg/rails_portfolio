class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :delete_all

  validates_uniqueness_of :phone
  validates :phone, phone: { possible: false, allow_blank: true, types: [:mobile] }

  def needs_mobile_number_verifying?
    if is_verified || phone.nil?
      false
    else
      true
    end
  end
end
