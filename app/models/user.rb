# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  token      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
end
