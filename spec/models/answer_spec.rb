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
require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
