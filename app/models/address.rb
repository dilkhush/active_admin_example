class Address < ActiveRecord::Base
  belongs_to :user

  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :zipcode, presence: true
  validates :zipcode, numericality: { only_integer: true }
end
