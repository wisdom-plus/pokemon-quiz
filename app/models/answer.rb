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
#  user_id    :bigint
#
# Indexes
#
#  index_answers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Answer < ApplicationRecord
  belongs_to :user

  before_save :prevent_blank_answer

  validates :content, presence: true, length: { maximum: 30 }, format: {with: /\p{katakana}/}

  private

    def prevent_blank_answer
      if content.blank?
        self.content = '解答なし'
      end
      self
    end
end
