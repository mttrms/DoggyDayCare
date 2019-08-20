# == Schema Information
#
# Table name: houses
#
#  id   :bigint           not null, primary key
#  name :string
#

class House < ApplicationRecord
  has_many :dogs,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Dog

  # def toys
  #   toys = []
  #   dogs.each do |dog|
  #     toys += dog.toys
  #   end
  # end

  has_many :toys,
    through: :dogs,
    source: :toys
end
