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
  before_save :prevent_blank_answer

  private

    def prevent_blank_answer
      if content.blank?
        self.content = '解答なし'
      end
      self
    end
end
