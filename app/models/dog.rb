# == Schema Information
#
# Table name: dogs
#
#  id       :bigint           not null, primary key
#  name     :string           not null
#  house_id :bigint           not null
#

class Dog < ApplicationRecord
  validates :name, presence: true
  validate :check_name_length

  def check_name_length
    unless self.name.length >= 4
      errors[:name] << "Name is too short, must be 4+ chars"
    end
  end

  # def toys
  #   Toy.where({ dog_id: self.id })
  # end

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House

  has_many :toys, 
    primary_key: :id, #dog's id
    foreign_key: :dog_id,
    class_name: :Toy
end
