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

  before_validation :prevent_blank_answer
  before_save :rigth_or_wrong

  validates :content, length: { maximum: 30 }, format: { with: /\A\p{katakana}+\z|(解答なし)/, message: :katakana }

  attr_accessor :poke_name

  private

    def prevent_blank_answer
      self.content = '解答なし' if content.blank?

      self
    end

    def rigth_or_wrong
      self.correct = content == @poke_name
    end
end
