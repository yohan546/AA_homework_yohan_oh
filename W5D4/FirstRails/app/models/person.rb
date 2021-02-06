# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  house_id   :integer          not null
#
class Person < ApplicationRecord

    belongs_to :house, 
        foreign_key: :house_id, 
        class_name: :House 
        
end
