# == Schema Information
#
# Table name: houses
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string
#
class House < ApplicationRecord
    validates :name, uniqueness: true 

    has_many :residents, 
        foreign_key: :house_id, 
        class_name: :Person
end
