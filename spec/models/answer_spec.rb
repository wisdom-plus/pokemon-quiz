# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  content    :string           default("解答なし")
#  correct    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poke_id    :bigint
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
