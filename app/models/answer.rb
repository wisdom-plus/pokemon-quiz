# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  content    :string
#  correct    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poke_id    :bigint
#
class Answer < ApplicationRecord
end
