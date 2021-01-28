# == Schema Information
#
# Table name: houses
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  person_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class House < ApplicationRecord
    validates :name, uniqueness: true 
end
