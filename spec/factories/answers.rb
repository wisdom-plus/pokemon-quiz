# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  content    :string
#  correct    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poke_id    :bigint
#
FactoryBot.define do
  factory :answer do
    
  end
end
