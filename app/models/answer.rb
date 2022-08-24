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

  before_save :prevent_no_answer


  private

  def prevent_no_answer
    if self.content.nil?
      self.content = "解答なし"
    else
      self
    end
    self
  end
end
